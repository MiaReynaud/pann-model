Class {
	#name : 'PannFisher',
	#superclass : 'CMAgent',
	#instVars : [
		'dailyEarnings'
	],
	#category : 'FemmesEtCoquillages-Model',
	#package : 'FemmesEtCoquillages-Model'
}

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
