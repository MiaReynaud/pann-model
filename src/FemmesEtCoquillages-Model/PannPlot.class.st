Class {
	#name : 'PannPlot',
	#superclass : 'CMCell',
	#instVars : [
		'state'
	],
	#category : 'FemmesEtCoquillages-Model',
	#package : 'FemmesEtCoquillages-Model'
}

{ #category : 'state changing' }
PannPlot >> beMangrove [

	state := #mangrove
]

{ #category : 'state changing' }
PannPlot >> beMudflat [

	state := #mudflat
]

{ #category : 'state changing' }
PannPlot >> beSea [

	state := #sea
]

{ #category : 'state changing' }
PannPlot >> beVillage [

	state := #village
]

{ #category : 'initialization' }
PannPlot >> initialize [ 

	super initialize.
]

{ #category : 'state changing' }
PannPlot >> isMangrove [

	^ state = #mangrove
]

{ #category : 'state changing' }
PannPlot >> isMudflat [

	^ state = #mudflat
]

{ #category : 'state changing' }
PannPlot >> isSea [

	^ state = #sea
]

{ #category : 'state changing' }
PannPlot >> isVillage [

	^ state = #village
]

{ #category : 'pov' }
PannPlot >> pov [ 

	<pov>
	
	state = #sea ifTrue: [ ^ CMPointOfView color: '70EAFF' ].
	state = #village ifTrue: [ ^ CMPointOfView color: '8F1437' ].
	state = #mudflat ifTrue: [ ^ CMPointOfView color: 'FFFCB3' ].
	state = #mangrove ifTrue: [ ^ CMPointOfView color: '0DB370' ].
	
	^ super pov. "if no state, super pov by default"
]

{ #category : 'accessing' }
PannPlot >> shellfishPopulation [
	"this method returns you the shellfish population in the cell "

	^ (self occupantsOfClass: PannShellfishCohort) first. "there can only be 1 population of shellfish on the cell, not more, not 0"
		
]

{ #category : 'accessing' }
PannPlot >> state [

	^ state
]

{ #category : 'accessing' }
PannPlot >> state: anObject [

	state := anObject
]
