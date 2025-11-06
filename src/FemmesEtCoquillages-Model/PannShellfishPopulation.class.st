Class {
	#name : 'PannShellfishPopulation',
	#superclass : 'CMAgent',
	#instVars : [
		'cohorts'
	],
	#category : 'FemmesEtCoquillages-Model',
	#package : 'FemmesEtCoquillages-Model'
}

{ #category : 'accessing' }
PannShellfishPopulation >> cohorts [

	^ cohorts
]

{ #category : 'accessing' }
PannShellfishPopulation >> cohorts: anObject [

	cohorts := anObject
]

{ #category : 'fishing methods' }
PannShellfishPopulation >> dailyFishableQuantity [ 

	 ^ self totalNumberOfShellfishes * 1/25 min: 3000. "we estimate that each woman can only cover 400m² per day. She only collects 50% of available shellfish in this area. Since the total area of a mudflat cell is 5000m², the total number of available shellfish in the cell (or in the population, it's the same because a cell has only one population and a population is on only one cell) should be multiplied by (400/5000)*0.5 = 1/25  "
]

{ #category : 'fishing methods' }
PannShellfishPopulation >> extractShellfish [

	| numberOfShellfishesToExtract exctractedFromCohort totalExtracted |
	
	totalExtracted := 0. 
	numberOfShellfishesToExtract := self dailyFishableQuantity.
	
	cohorts reversed do: [ :cohort | "we reverse it so that the fishers take the bigest ones in priority"
		exctractedFromCohort := cohort densityOfShellfish min: numberOfShellfishesToExtract.
		cohort densityOfShellfish: cohort densityOfShellfish - exctractedFromCohort.
		numberOfShellfishesToExtract := numberOfShellfishesToExtract - exctractedFromCohort.
		totalExtracted := totalExtracted + exctractedFromCohort ].
	
	^ totalExtracted
	

]

{ #category : 'init  ' }
PannShellfishPopulation >> initialize [ 

	super initialize .

	cohorts := (1 to: 7 by: 1) collect: [ :size |
  		PannShellfishCohort new
    		sizeOfShellfishes: size;
    		densityOfShellfish: 2500000; "we estimate that there is one shellfish of each cohort in 20cm², so it's 2 500 000 shellfish of each cohort in 0,5 ha"
    		yourself ].
]

{ #category : 'pov ' }
PannShellfishPopulation >> pov [ 
	<pov>
	^ CMPointOfView 
		color: '804C1F'
		shape: #circle 
		size: 0.2
]

{ #category : 'ecological methods' }
PannShellfishPopulation >> recruit [ 

	| numberOfNewborns |
	
	numberOfNewborns := self cell sare recruitCapacity.
	
	cohorts first densityOfShellfish: cohorts first densityOfShellfish + numberOfNewborns.
]

{ #category : 'not used methods' }
PannShellfishPopulation >> reproduce [

    | dailyNumberOfNewbornsPerShellfish matureCohorts numberOfNewborns |

    matureCohorts := cohorts select: [ :each | each densityOfShellfish >= 2 ].

    dailyNumberOfNewbornsPerShellfish := 2.0/30. "on average a shellfish creates a 5 shellfishes once a month"
    numberOfNewborns := 0.

    matureCohorts do: [ :each |
        numberOfNewborns := numberOfNewborns + (dailyNumberOfNewbornsPerShellfish * each densityOfShellfish) ].

    cohorts first densityOfShellfish: cohorts first densityOfShellfish + numberOfNewborns.
]

{ #category : 'ecological methods' }
PannShellfishPopulation >> shiftCohorts [

	| cohort nextCohort |
	

(1 to: cohorts size - 1) reverseDo: [ :i |
	cohort := cohorts at: i.
    nextCohort := cohorts at: i + 1.

    nextCohort densityOfShellfish: nextCohort densityOfShellfish + cohort densityOfShellfish .
    cohort densityOfShellfish: 0 ].
]

{ #category : 'ecological methods' }
PannShellfishPopulation >> stepCohort [

    "making shellfishes grow"
	self cormasModel dayCounter % 16 = 0 ifTrue: [ self shiftCohorts ].

    "recruitment"
	self cormasModel dayCounter % 2 = 0 ifTrue: [ self recruit ].
]

{ #category : 'accessing  ' }
PannShellfishPopulation >> totalNumberOfShellfishes [

 ^ cohorts sum: [:cohort | cohort densityOfShellfish].
]
