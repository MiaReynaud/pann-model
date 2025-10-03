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
	"This method is used to define the initial environment of a simulation. It will be executed once when the simulation is initialized."

	<init>
	| seaPlots villagePlot mudflatPlots |
	"create grid"
	self
		createGridNumberOfRows: 70
		numberOfColumns: 70
		neighbourhood: 6
		closed: true.

	"create sea"
	seaPlots := self
		            selectCellsBetweenRow: 1
		            andRow: 70
		            column: 1
		            andColumn: 70.

	seaPlots do: #beSea.

	"create village"
	villagePlot := self pickCellAt: 35 @ 35.
	villagePlot beVillage.

	"create mudflat"
	mudflatPlots := self
		                selectCellsBetweenRow: 6
		                andRow: 10
		                column: 6
		                andColumn: 10.
	mudflatPlots add: (self
			 selectCellsBetweenRow: 60
			 andRow: 65
			 column: 30
			 andColumn: 35).
	mudflatPlots add: (self
			 selectCellsBetweenRow: 32
			 andRow: 37
			 column: 7
			 andColumn: 11).
	mudflatPlots add: (self
			 selectCellsBetweenRow: 33
			 andRow: 38
			 column: 36
			 andColumn: 39).
	mudflatPlots add: (self
			 selectCellsBetweenRow: 20
			 andRow: 24
			 column: 40
			 andColumn: 43).
	mudflatPlots add: (self
			 selectCellsBetweenRow: 45
			 andRow: 49
			 column: 55
			 andColumn: 59).

	mudflatPlots flattened do: #beMudflat.


	"add shellfish on every mudflat cell"
	(self cells select: [ :c | c state = #mudflat ]) do: [ :cell |
		self newEntity: PannShellfish locatedAt: cell ].

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
	
	(self shuffled: (self @@ PannFisher))
		do: #goToFishingSpot;
		do: #fish. 
]
