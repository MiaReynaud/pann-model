Class {
	#name : 'PannShellfishPopulation',
	#superclass : 'CMAgent',
	#instVars : [
		'cohorts'
	],
	#category : 'FemmesEtCoquillages-Model',
	#package : 'FemmesEtCoquillages-Model'
}

{ #category : 'initialize-release' }
PannShellfishPopulation >> dailyFishableQuantity [ 

	 ^ self totalNumberOfShellfish / 25
]

{ #category : 'as yet unclassified' }
PannShellfishPopulation >> extractShellfish [

	| numberOfShellfishesToExtract exctractedFromCohort totalExtracted |
	
	numberOfShellfishesToExtract := self dailyFishableQuantity.
	totalExtracted := 0. 
	
	cohorts reversed do: [ :cohort |
		exctractedFromCohort := cohort numberOfShellfish min: numberOfShellfishesToExtract.
		cohort numberOfShellfish: cohort numberOfShellfish - exctractedFromCohort.
		numberOfShellfishesToExtract := numberOfShellfishesToExtract - exctractedFromCohort.
		totalExtracted := totalExtracted + exctractedFromCohort ].
	
	^ totalExtracted 
]

{ #category : 'init  ' }
PannShellfishPopulation >> initialize [ 

	super initialize .

	cohorts := (1 to: 7 by: 0.5) collect: [ :size |
  		PannShellfishCohort new
    		age: 0;
    		sizeOfShellfishes: size;
    		numberOfShellfish: 100;
    		yourself ].
]

{ #category : 'init  ' }
PannShellfishPopulation >> pov [ 
	<pov>
	^ CMPointOfView 
		color: '804C1F'
		shape: #circle 
		size: 0.2
]

{ #category : 'initialize-release' }
PannShellfishPopulation >> reproduce [ 

    | dailyNumberOfNewbornsPerShellfish matureCohorts numberOfNewborns |

    matureCohorts := cohorts select: [ :each | each sizeOfShellfishes >= 2 ].

    dailyNumberOfNewbornsPerShellfish := 2.0/30. "on average a shellfish creates a 5 shellfishes once a month"
    numberOfNewborns := 0.

    matureCohorts do: [ :each |
        numberOfNewborns := numberOfNewborns + (dailyNumberOfNewbornsPerShellfish * each numberOfShellfish) ].

    cohorts first numberOfShellfish: cohorts first numberOfShellfish + numberOfNewborns.
]

{ #category : 'initialize-release' }
PannShellfishPopulation >> shiftCohorts [

	| cohort nextCohort |
	

(1 to: cohorts size - 1) reverseDo: [ :i |
	cohort := cohorts at: i.
    nextCohort := cohorts at: i + 1.

    nextCohort numberOfShellfish: nextCohort numberOfShellfish + cohort numberOfShellfish .
    cohort numberOfShellfish: 0 ].
]

{ #category : 'initialize-release' }
PannShellfishPopulation >> stepCohort [

    "making shellfishes grow"
	self cormasModel dayCounter % 16 = 0 ifTrue: [ self shiftCohorts ].

    "making shellfishes reproduce"
	self cormasModel dayCounter % 2 = 0 ifTrue: [ self reproduce ].
]

{ #category : 'initialize-release' }
PannShellfishPopulation >> totalNumberOfShellfish [

 ^ cohorts sum: [:cohort | cohort numberOfShellfish].
]
