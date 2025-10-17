Class {
	#name : 'PannShellfishCohort',
	#superclass : 'CMAgent',
	#instVars : [
		'age',
		'size',
		'numberOfShellfish'
	],
	#classInstVars : [
		'growthPerDay'
	],
	#category : 'FemmesEtCoquillages-Model',
	#package : 'FemmesEtCoquillages-Model'
}

{ #category : 'accessing' }
PannShellfishCohort class >> growthPerDay [

	^ growthPerDay
]

{ #category : 'accessing' }
PannShellfishCohort class >> growthPerDay: anObject [

	growthPerDay := anObject
]

{ #category : 'accessing' }
PannShellfishCohort class >> initializeParameters [ 

	super initializeParameters. 
	
	growthPerDay := 1 / 30.0.  "≈ 0.033 mm/day"
]

{ #category : 'accessing' }
PannShellfishCohort >> age [

	^ age
]

{ #category : 'accessing' }
PannShellfishCohort >> age: anObject [

	age := anObject
]

{ #category : 'accessing' }
PannShellfishCohort >> grow [
	
	size := size + self class growthPerDay.
]

{ #category : 'accessing' }
PannShellfishCohort >> numberOfShellfish [

	^ numberOfShellfish
]

{ #category : 'accessing' }
PannShellfishCohort >> numberOfShellfish: anObject [

	numberOfShellfish := anObject
]

{ #category : 'accessing' }
PannShellfishCohort >> size [

	^ size
]

{ #category : 'accessing' }
PannShellfishCohort >> size: anObject [

	size := anObject
]
