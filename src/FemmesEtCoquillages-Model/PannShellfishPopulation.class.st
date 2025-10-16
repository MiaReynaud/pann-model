Class {
	#name : 'PannShellfishPopulation',
	#superclass : 'CMAgent',
	#instVars : [
		'smallCount',
		'mediumCount',
		'matureCount',
		'bigCount',
		'smallMeanSize',
		'mediumMeanSize',
		'matureMeanSize',
		'bigMeanSize',
		'totalNumberOfShellfish'
	],
	#category : 'FemmesEtCoquillages-Model',
	#package : 'FemmesEtCoquillages-Model'
}

{ #category : 'init  ' }
PannShellfishPopulation >> init [ 

	super init.
	
	smallCount := 100.
   mediumCount := 75.
   matureCount := 50.
   bigCount := 10.

   smallMeanSize := 0.0.
   mediumMeanSize := 16.0.
   matureMeanSize := 19.0.
   bigMeanSize := 30.0.

   ^self
]

{ #category : 'initialize-release' }
PannShellfishPopulation >> stepCohort [

	 | growthPerDay recruits transitionToMedium transitionToMature transitionToBig |

    growthPerDay := 1 / 30.0.  "≈ 0.033 mm/day"

    "making shellfishes grow"
   smallMeanSize := smallMeanSize + growthPerDay.
   mediumMeanSize := mediumMeanSize + growthPerDay.
   matureMeanSize := matureMeanSize + growthPerDay.
	bigMeanSize := bigMeanSize + growthPerDay.

    "Switching class depending on size"
    transitionToMedium := 0.
    transitionToMature := 0.
    transitionToBig := 0.

    (smallMeanSize > 16) ifTrue: [
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
    ].

    "Reproduction"
    recruits := ((matureCount * 0.001) + (bigCount * 0.0005)) rounded. "≈ 0.1% par jour"
    smallCount := smallCount + recruits.

    "Mortality"
    smallCount := (smallCount * 0.99) rounded.
    mediumCount := (mediumCount * 0.99) rounded.
    matureCount := (matureCount * 0.99) rounded.
    bigCount := (bigCount * 0.99) rounded.

    "Conversion to integer"
    smallCount := smallCount max: 0.
    mediumCount := mediumCount max: 0.
    matureCount := matureCount max: 0.
    bigCount := bigCount max: 0.
]
