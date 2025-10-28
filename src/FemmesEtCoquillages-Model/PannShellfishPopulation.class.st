Class {
	#name : 'PannShellfishPopulation',
	#superclass : 'CMAgent',
	#instVars : [
		'cohorts',
		'totalNumberOfShellfish'
	],
	#category : 'FemmesEtCoquillages-Model',
	#package : 'FemmesEtCoquillages-Model'
}

{ #category : 'initialize-release' }
PannShellfishPopulation >> dailyFishableQuantity [ 

	| monthlyEarnings shellfishesPerBag |
	
	 "those magic numbers come from the womens estimation of number of bags fished per women per day each month"
	monthlyEarnings := #(2.07 1.86 1.64 1.43 1.21 1 1.3 1.6 1.9 2.2 2.5 2.29).
	
	"We estimate that a bag is composed of 1200 shellfish on average"
	shellfishesPerBag := 1200.

	 ^ (monthlyEarnings at: self cormasModel currentMonth) * shellfishesPerBag.
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
	
	totalNumberOfShellfish := cohorts sum: [:cohort | cohort numberOfShellfish].
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

    | numberOfNewbornsPerShellfish matureCohorts numberOfNewborns |

    matureCohorts := cohorts select: [ :each | each sizeOfShellfishes >= 2 ].

    numberOfNewbornsPerShellfish := 1.
    numberOfNewborns := 0.

    matureCohorts do: [ :each |
        numberOfNewborns := numberOfNewborns + (numberOfNewbornsPerShellfish * each numberOfShellfish) ].

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
	
	totalNumberOfShellfish := cohorts sum: [:cohort | cohort numberOfShellfish].
]

{ #category : 'initialize-release' }
PannShellfishPopulation >> totalNumberOfShellfish [

 ^ totalNumberOfShellfish
]

{ #category : 'initialize-release' }
PannShellfishPopulation >> totalNumberOfShellfish: anObject [

 totalNumberOfShellfish := anObject.
]
