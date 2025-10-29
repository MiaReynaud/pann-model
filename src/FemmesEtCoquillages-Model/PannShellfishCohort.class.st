Class {
	#name : 'PannShellfishCohort',
	#superclass : 'CMAgent',
	#instVars : [
		'numberOfShellfish',
		'sizeOfShellfishes'
	],
	#classInstVars : [
		'growthPerDay'
	],
	#category : 'FemmesEtCoquillages-Model',
	#package : 'FemmesEtCoquillages-Model'
}

{ #category : 'accessing' }
PannShellfishCohort class >> growthPerDay [

	^ growthPerDay
]

{ #category : 'accessing' }
PannShellfishCohort class >> growthPerDay: anObject [

	growthPerDay := anObject
]

{ #category : 'accessing' }
PannShellfishCohort class >> initializeParameters [ 

	super initializeParameters. 
	
	growthPerDay := 1 / 30.0.  "≈ 0.033 mm/day"
]

{ #category : 'accessing' }
PannShellfishCohort >> numberOfShellfish [

	^ numberOfShellfish
]

{ #category : 'accessing' }
PannShellfishCohort >> numberOfShellfish: anObject [

	numberOfShellfish := anObject
]

{ #category : 'accessing' }
PannShellfishCohort >> sizeOfShellfishes [

	^ sizeOfShellfishes
]

{ #category : 'accessing' }
PannShellfishCohort >> sizeOfShellfishes: anObject [

	sizeOfShellfishes := anObject
]
