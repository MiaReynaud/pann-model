Class {
	#name : 'PannShellfishPopulation',
	#superclass : 'CMAgent',
	#category : 'FemmesEtCoquillages-Model',
	#package : 'FemmesEtCoquillages-Model'
}

{ #category : 'accessing' }
PannShellfishPopulation >> dailyFishableQuantity [

    ^ #(2.07 1.86 1.64 1.43 1.22 1 1.3 1.6 1.9 2.2 2.5 2.23) at: self cormasModel currentMonth.
]

{ #category : 'pov' }
PannShellfishPopulation >> pov [ 
	<pov>
	^ CMPointOfView 
		color: '804C1F'
		shape: #circle 
		size: 0.2
		
]
