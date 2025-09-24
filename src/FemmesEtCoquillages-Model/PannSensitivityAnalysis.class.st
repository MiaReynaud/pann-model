Class {
	#name : 'PannSensitivityAnalysis',
	#superclass : 'Object',
	#instVars : [
		'stepsPerSimulation',
		'numberOfRepetitions',
		'recordEvery',
		'parameterName',
		'values',
		'file',
		'modelClass',
		'initMethod',
		'controlMethod',
		'data'
	],
	#category : 'FemmesEtCoquillages-Model',
	#package : 'FemmesEtCoquillages-Model'
}

{ #category : 'initialization' }
PannSensitivityAnalysis >> initialize [

	super initialize.
	
	stepsPerSimulation := 1000.
	numberOfRepetitions := 10.
	recordEvery := 100.

	parameterName := #numberOfFishers. 
	values := (1 to: 10 by: 1) asOrderedCollection.

	file := 'data.csv' asFileReference.

	modelClass := PannModel.
	initMethod := #init.
	controlMethod := #step.
]

{ #category : 'initialization' }
PannSensitivityAnalysis >> run [
	<script: 'self new run'>
	
	| parameter simulation record |
	parameter := modelClass parameters detect: [ :p | p name = parameterName ].

	data := OrderedCollection new.

	values do: [ :value |
		simulation := (CMSimulation for: modelClass)
			activeInitSelector: initMethod;
			activeControlSelector: controlMethod;
			initializeSimulation;
			yourself.
		
		parameter value: value.
	
		(1 to: numberOfRepetitions) asOrderedCollection
			do: [ :repetition |
				stepsPerSimulation timesRepeat: [ simulation runStep ].
		
				data addAll: ((recordEvery to: simulation data size by: recordEvery) collect: [ :i |
					record := (simulation data at: i) copy.
					record at: 'stepNumber' put: i.
					record at: 'parameterValue' put: value.
					record at: 'repetitionNumber' put: repetition.
				record ]) ]
			displayingProgress: [ :repetition | 'Repetition ', repetition asString ]
	] displayingProgress: [ :value | parameter name, ' = ', value asString ].
	
	self saveData
]

{ #category : 'initialization' }
PannSensitivityAnalysis >> saveData [

	| columnNames cleanRow |
	
	file writeStreamDo: [ :stream |
		columnNames := data first keys.
		stream nextPutAll: (',' join: columnNames); cr.
		
		data do: [ :row |
			cleanRow := row collect: [ :each |
				each isFraction ifTrue: [ each  asFloat ] ifFalse: [ each ] ].
			stream nextPutAll: (',' join: cleanRow); cr ] ]
]
