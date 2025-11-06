Class {
	#name : 'PannShellfishCohort',
	#superclass : 'CMAgent',
	#instVars : [
		'shellfishAge',
		'shellfishSize',
		'shellfishDensity'
	],
	#category : 'FemmesEtCoquillages-Model',
	#package : 'FemmesEtCoquillages-Model'
}

{ #category : 'initialization' }
PannShellfishCohort >> initialize [ 
	super initialize.
]

{ #category : 'accessing' }
PannShellfishCohort >> shellfishAge [

	^ shellfishAge
]

{ #category : 'accessing' }
PannShellfishCohort >> shellfishAge: aNumber [

	shellfishAge := aNumber
]

{ #category : 'accessing' }
PannShellfishCohort >> shellfishDensity [

	^ shellfishDensity
]

{ #category : 'accessing' }
PannShellfishCohort >> shellfishDensity: aNumber [

	shellfishDensity := aNumber
]

{ #category : 'accessing' }
PannShellfishCohort >> shellfishSize [

	^ shellfishSize
]

{ #category : 'accessing' }
PannShellfishCohort >> shellfishSize: aNumber [

	shellfishSize := aNumber
]
