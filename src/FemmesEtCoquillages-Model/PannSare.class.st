Class {
	#name : 'PannSare',
	#superclass : 'CMSpatialEntityAggregate',
	#instVars : [
		'name',
		'recruitCapacity'
	],
	#category : 'FemmesEtCoquillages-Model',
	#package : 'FemmesEtCoquillages-Model'
}

{ #category : 'accessing' }
PannSare >> name [

	^ name
]

{ #category : 'accessing' }
PannSare >> name: anObject [

	name := anObject
]

{ #category : 'accessing' }
PannSare >> recruitCapacity [

	^ recruitCapacity
]

{ #category : 'accessing' }
PannSare >> recruitCapacity: anObject [

	recruitCapacity := anObject
]
