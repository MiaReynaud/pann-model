Class {
	#name : 'PannFisher',
	#superclass : 'CMAgent',
	#instVars : [
		'dailyEarnings'
	],
	#classInstVars : [
		'shellfishPrice'
	],
	#category : 'FemmesEtCoquillages-Model',
	#package : 'FemmesEtCoquillages-Model'
}

{ #category : 'initialization' }
PannFisher class >> initializeParameters [ 

	super initializeParameters.
	shellfishPrice := 3500 "en FCFA"
]

{ #category : 'accessing' }
PannFisher class >> shellfishPrice [

	^ shellfishPrice
]

{ #category : 'accessing' }
PannFisher class >> shellfishPrice: anObject [

	shellfishPrice := anObject
]

{ #category : 'accessing' }
PannFisher >> dailyEarnings [

	^ dailyEarnings
]

{ #category : 'accessing' }
PannFisher >> dailyEarnings: anObject [

	dailyEarnings := anObject
]

{ #category : 'accessing' }
PannFisher >> fish [
	 | shellfishPopulation |
    
    "look for shellfish population on the same cell as the fisher"
   shellfishPopulation := self cell shellfishes .

    "if there is no shellfish, there is no earning, if there is a population, the fisher earns the dailyFishableQuantity of this agent"
   shellfishPopulation 
		ifEmpty: [ dailyEarnings := 0 ]
		ifNotEmpty: [ dailyEarnings := shellfishPopulation first dailyFishableQuantity ]. "as shellfishPopulation is a collection of 0 or 1 element, we ask to look at the dailyFishableQuantity of the first element of the collection"
]

{ #category : 'accessing' }
PannFisher >> goToFishingSpot [
	"The fisher go to the fishing spot where she think she will earn the most"
	
	<action>
	| fishingSpot |
	
	fishingSpot := self selectRandomlyFrom: 
		(cormasModel cells select: [ :c | c state = #mudflat ]).
	
	self moveTo: fishingSpot.
	

]

{ #category : 'accessing' }
PannFisher >> initialize [ 

	super initialize.
	dailyEarnings := 0.
]

{ #category : 'accessing' }
PannFisher >> pov [ 
	<pov>
	^ CMPointOfView 
		color: 'FF7700'
		shape: #triangle 
		size: 0.5
]
