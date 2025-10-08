Class {
	#name : 'PannShellfish',
	#superclass : 'CMAgent',
	#instVars : [
		'age',
		'size'
	],
	#category : 'FemmesEtCoquillages-Model',
	#package : 'FemmesEtCoquillages-Model'
}

{ #category : 'accessing' }
PannShellfish >> age [

	^ age
]

{ #category : 'accessing' }
PannShellfish >> age: anObject [

	age := anObject
]

{ #category : 'accessing' }
PannShellfish >> dailyFishableQuantity [

    ^ #(2.07 1.86 1.64 1.43 1.21 1 1.3 1.6 1.9 2.2 2.5 2.29) at: self cormasModel currentMonth.

]

{ #category : 'accessing' }
PannShellfish >> initialize [ 

	super initialize.
	age := (self randomBetween: 1 and: 7300 ) asInteger. "7300 days = 20 years"
	size := (age / 30) asFloat.
]

{ #category : 'pov' }
PannShellfish >> pov [ 
	<pov>
	^ CMPointOfView 
		color: '804C1F'
		shape: #circle 
		size: 0.2
		
]

{ #category : 'accessing' }
PannShellfish >> size1 [

	^ size
]

{ #category : 'accessing' }
PannShellfish >> size: anObject [

	size := anObject
]
