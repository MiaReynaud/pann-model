Class {
	#name : 'PannSare',
	#superclass : 'CMCell',
	#instVars : [
		'identity',
		'priceToAcces',
		'recruitCapacity',
		'growthCapacity',
		'naturalMortalityRate',
		'cells'
	],
	#category : 'FemmesEtCoquillages-Model',
	#package : 'FemmesEtCoquillages-Model'
}

{ #category : 'accessing' }
PannSare >> cells [

	^ cells
]

{ #category : 'accessing' }
PannSare >> cells: aCollection [

	cells := aCollection
]

{ #category : 'accessing' }
PannSare >> growthCapacity [

	^ growthCapacity
]

{ #category : 'accessing' }
PannSare >> growthCapacity: anObject [

	growthCapacity := anObject
]

{ #category : 'accessing' }
PannSare >> identity [

	^ identity
]

{ #category : 'accessing' }
PannSare >> identity: anObject [

	identity := anObject
]

{ #category : 'init   ' }
PannSare >> initialize [

	| sare mudflatCellsGroups |
	super initialize.
	
	sare := (1 to: 5 by: 1) collect: [ :ID |
		PannSare new
			identity: ID ;
			cells: ( mudflatCellsGroups at: ID) ;
    		yourself ].
	
	
]

{ #category : 'init   ' }
PannSare >> mudflatCellsGroups [
	
	| group1 group2 group3 group4 group5 groups |
	
	group1 := OrderedCollection withAll: {
	5@4. 6@4. 7@4.
	5@5. 6@5. 7@5. 8@5.
	5@6. 6@6. 7@6.
	}.

	group2 := OrderedCollection withAll: {
	11@11.
	11@12.
	}.

	group3 := OrderedCollection withAll: {
	15@16. 16@16. 17@16.
	15@17. 16@17. 17@17. 18@17.
	15@18. 16@18. 17@18.
	}.

	group4 := OrderedCollection withAll: {
	20@22.
	20@23.
	}.

	group5 := OrderedCollection withAll: {
	25@27. 26@27. 27@27.
	25@28. 26@28. 27@28. 28@28.
	}.

"groups is a collection of 5 OrderedCollection of point (coordinates of mudflat cells)"
	groups := { group1. group2. group3. group4. group5 }.
	
	^groups
	

]

{ #category : 'accessing' }
PannSare >> naturalMortalityRate [

	^ naturalMortalityRate
]

{ #category : 'accessing' }
PannSare >> naturalMortalityRate: anObject [

	naturalMortalityRate := anObject
]

{ #category : 'accessing' }
PannSare >> priceToAcces [

	^ priceToAcces
]

{ #category : 'accessing' }
PannSare >> priceToAcces: anObject [

	priceToAcces := anObject
]

{ #category : 'accessing' }
PannSare >> recruitCapacity [

	^ recruitCapacity
]

{ #category : 'accessing' }
PannSare >> recruitCapacity: anObject [

	recruitCapacity := anObject
]
