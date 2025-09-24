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

{ #category : 'accessing' }
PannPlot >> pov [ 

	<pov>
	
	state = #sea ifTrue: [ ^ CMPointOfView color: '70EAFF' ].
	state = #village ifTrue: [ ^ CMPointOfView tile: PannTileset hutte size: 0.3 ].
	state = #mudflat ifTrue: [ ^ CMPointOfView color: 'FFFCB3' ].
]

{ #category : 'accessing' }
PannPlot >> state [

	^ state
]
