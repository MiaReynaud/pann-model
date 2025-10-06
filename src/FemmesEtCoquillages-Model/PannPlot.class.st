Class {
	#name : 'PannPlot',
	#superclass : 'CMCell',
	#instVars : [
		'state'
	],
	#category : 'FemmesEtCoquillages-Model',
	#package : 'FemmesEtCoquillages-Model'
}

{ #category : 'accessing' }
PannPlot >> beMangrove [

	state := #mangrove
]

{ #category : 'accessing' }
PannPlot >> beMudflat [

	state := #mudflat
]

{ #category : 'accessing' }
PannPlot >> beSea [

	state := #sea
]

{ #category : 'accessing' }
PannPlot >> beVillage [

	state := #village
]

{ #category : 'initialization' }
PannPlot >> initialize [ 

	super initialize.
]

{ #category : 'accessing' }
PannPlot >> isMangrove [

	^ state = #mangrove
]

{ #category : 'accessing' }
PannPlot >> isMudflat [

	^ state = #mudflat
]

{ #category : 'accessing' }
PannPlot >> isSea [

	^ state = #sea
]

{ #category : 'accessing' }
PannPlot >> isVillage [

	^ state = #village
]

{ #category : 'accessing' }
PannPlot >> pov [ 

	<pov>
	
	state = #sea ifTrue: [ ^ CMPointOfView color: '70EAFF' ].
	state = #village ifTrue: [ ^ CMPointOfView color: '8F1437' ].
	state = #mudflat ifTrue: [ ^ CMPointOfView color: 'FFFCB3' ].
	state = #mangrove ifTrue: [ ^ CMPointOfView color: '0DB370' ].
	
	^ super pov. "if no state, super pov by default"
]

{ #category : 'accessing' }
PannPlot >> shellfishes [
	"this method returns you the shellfish in the cell "

	^ self occupantsOfClass: PannShellfish.
		
]

{ #category : 'accessing' }
PannPlot >> state [

	^ state
]

{ #category : 'accessing' }
PannPlot >> state: anObject [

	state := anObject
]
