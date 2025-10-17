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

	 ^ #(2.07 1.86 1.64 1.43 1.21 1 1.3 1.6 1.9 2.2 2.5 2.29) at: self cormasModel currentMonth.
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

	 | recruits transitionToMedium transitionToMature transitionToBig |

    "making shellfishes grow"
	self cormasModel dayCounter % 16 = 0 ifTrue: [ self shiftCohorts ].

    "making shellfishes reproduce"
	self cormasModel dayCounter % 2 = 0 ifTrue: [ self reproduce ].



    "Switching class depending on size"
"    transitionToMedium := 0.
    transitionToMature := 0.
    transitionToBig := 0."

    "(smallMeanSize > 16) ifTrue: [
        transitionToMedium := smallCount * ((smallMeanSize - 16) / smallMeanSize) min: smallCount.
        smallCount := smallCount - transitionToMedium.
        mediumCount := mediumCount + transitionToMedium.
        smallMeanSize := 1.0.
    ].

    (mediumMeanSize > 19) ifTrue: [
        transitionToMature := mediumCount * ((mediumMeanSize - 19) / mediumMeanSize) min: mediumCount.
        mediumCount := mediumCount - transitionToMature.
        matureCount := matureCount + transitionToMature.
        mediumMeanSize := 16.0.
    ].

    (matureMeanSize > 40) ifTrue: [
        transitionToBig := matureCount * ((matureMeanSize - 40) / matureMeanSize) min: matureCount.
        matureCount := matureCount - transitionToBig.
        bigCount := bigCount + transitionToBig.
        matureMeanSize := 19.0.
    ]."

    "Reproduction"
"    recruits := ((matureCount * 0.001) + (bigCount * 0.0005)) rounded. ""≈ 0.1% par jour""
    smallCount := smallCount + recruits."

    "Mortality"
"    smallCount := (smallCount * 0.99) rounded.
    mediumCount := (mediumCount * 0.99) rounded.
    matureCount := (matureCount * 0.99) rounded.
    bigCount := (bigCount * 0.99) rounded."

    "Conversion to integer"
  "  smallCount := smallCount max: 0.
    mediumCount := mediumCount max: 0.
    matureCount := matureCount max: 0.
    bigCount := bigCount max: 0."
]
