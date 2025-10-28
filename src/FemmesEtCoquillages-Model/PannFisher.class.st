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

{ #category : 'actions' }
PannFisher >> fish [
	 | shellfishPopulation |
    
    "look for shellfish population on the same cell as the fisher"
   shellfishPopulation := self cell shellfishPopulation .

	dailyEarnings := shellfishPopulation dailyFishableQuantity.
	
	shellfishPopulation totalNumberOfShellfish: shellfishPopulation totalNumberOfShellfish - dailyEarnings.
]

{ #category : 'actions' }
PannFisher >> goToFishingSpot [
	"The fisher go to the fishing spot where she think she will earn the most"
	
	<action>
	| fishingSpot |
	
	fishingSpot := self selectRandomlyFrom: 
		(cormasModel cells select: [ :c | c state = #mudflat ]).
	
	self moveTo: fishingSpot.
	

]

{ #category : 'actions' }
PannFisher >> goToVillage [
	"The fisher go to the fishing spot where she think she will earn the most"
	
	<action>
	| village |
	
	village := self selectRandomlyFrom: 
		(cormasModel cells select: [ :c | c state = #village ]).
	
	self moveTo: village.
	

]

{ #category : 'initialize' }
PannFisher >> initialize [ 

	super initialize.
	dailyEarnings := 0.
]

{ #category : 'pov' }
PannFisher >> pov [ 
	<pov>
	^ CMPointOfView 
		color: 'FF7700'
		shape: #triangle 
		size: 0.5
]
