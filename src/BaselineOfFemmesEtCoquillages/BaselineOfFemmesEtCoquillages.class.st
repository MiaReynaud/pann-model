Class {
	#name : 'BaselineOfFemmesEtCoquillages',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfFemmesEtCoquillages',
	#package : 'BaselineOfFemmesEtCoquillages'
}

{ #category : 'as yet unclassified' }
BaselineOfFemmesEtCoquillages >> baseline: spec [
	<baseline>
	spec for: #common do: [
		spec
			package: 'FemmesEtCoquillages-Model';
		
			package: 'FemmesEtCoquillages-Model-Tests'
			with: [ spec requires: #('FemmesEtCoquillages-Model') ] ].
]
