Class {
	#name : 'PannShellfish',
	#superclass : 'CMAgent',
	#instVars : [
		'dailyFishableQuantity'
	],
	#category : 'FemmesEtCoquillages-Model',
	#package : 'FemmesEtCoquillages-Model'
}

{ #category : 'accessing' }
PannShellfish >> dailyFishableQuantity [

	^ dailyFishableQuantity
]

{ #category : 'accessing' }
PannShellfish >> dailyFishableQuantity: anObject [

	dailyFishableQuantity := anObject
]

{ #category : 'initialization' }
PannShellfish >> initialize [ 

	super initialize.
	self dailyFishableQuantity: 1.5.
]

{ #category : 'accessing' }
PannShellfish >> pov [ 
	<pov>
	^ CMPointOfView 
		color: '804C1F'
		shape: #circle 
		size: 0.2
		
]
