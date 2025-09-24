Class {
	#name : 'PannModel',
	#superclass : 'CMAbstractModel',
	#classInstVars : [
		'numberOfFishers'
	],
	#category : 'FemmesEtCoquillages-Model',
	#package : 'FemmesEtCoquillages-Model'
}

{ #category : 'initialization' }
PannModel class >> initializeParameters [
	super initializeParameters.
	numberOfFishers := 5
]

{ #category : 'as yet unclassified' }
PannModel class >> modelName [
	"A human-friendly name of the model"
	^ 'Femmes et Coquillages'
]

{ #category : 'accessing' }
PannModel class >> numberOfFishers [

	^ numberOfFishers
]

{ #category : 'accessing' }
PannModel class >> numberOfFishers: anObject [

	numberOfFishers := anObject
]

{ #category : 'accessing' }
PannModel class >> prefix [
	"Every class name in model package must begin with this prefix"
	^ 'Pann'.
]

{ #category : 'as yet unclassified' }
PannModel >> init [
	<init>
	"This method is used to define the initial environment of a simulation. It will be executed once when the simulation is initialized."
	
	| seaPlots villagePlot mudflatPlots |
	
"create grid"	
	self
		createGridNumberOfRows: 31
		numberOfColumns: 31
		neighbourhood: 6
		closed: true.
		
"create sea"
	seaPlots := self
						selectCellsBetweenRow: 1
						andRow: 31
						column: 1
						andColumn: 31.
						
	seaPlots do: #beSea.
	
"create village"
	villagePlot := self pickCellAt: 15@15.
	villagePlot beVillage.

"create mudflat"
	mudflatPlots := self
						selectCellsBetweenRow: 5 
						andRow: 10 
						column: 5 
						andColumn: 10.
	mudflatPlots add: (self selectCellsBetweenRow: 13 
									andRow: 20 
									column: 23 
									andColumn: 28).
	mudflatPlots add: (self selectCellsBetweenRow: 21 
									andRow: 28 
									column: 7 
									andColumn: 14 ).
	
	mudflatPlots flattened do: #beMudflat.

"add shellfish"
	self 
		createN: 30
		randomlyLocatedEntities: PannShellfish 
		constrainedBy: [ :aCell | aCell state = #mudflat ].
		
"add fishers"
	self 
		createN: self class numberOfFishers
		randomlyLocatedEntities: PannFisher 
		constrainedBy: [ :aCell | aCell state = #mudflat ]
	
]

{ #category : 'as yet unclassified' }
PannModel >> step [
	<control>
	"This method will be executed at every step of the simulation"
]
