Class {
	#name : 'PannShellfish',
	#superclass : 'CMAgent',
	#instVars : [
		'dailyFishableQuantity'
	],
	#category : 'FemmesEtCoquillages-Model',
	#package : 'FemmesEtCoquillages-Model'
}

{ #category : 'accessing' }
PannShellfish >> dailyFishableQuantity [

	^ dailyFishableQuantity
]

{ #category : 'accessing' }
PannShellfish >> dailyFishableQuantity: anObject [

	dailyFishableQuantity := anObject
]

{ #category : 'initialization' }
PannShellfish >> initialize [ 

	super initialize.
	self dailyFishableQuantity: 2.5.
]

{ #category : 'pov' }
PannShellfish >> pov [ 
	<pov>
	^ CMPointOfView 
		color: '804C1F'
		shape: #circle 
		size: 0.2
		
]

{ #category : 'actions' }
PannShellfish >> updateDailyFishableQuantity [
    "Updates the daily catchable quantity by month of the year.
Decreases linearly from 2.5 (November) to 1.0 (June), then increases back to 2.5 (November)."

    
    | month valueAtStart valueAtMid valueAtEnd slope value |

    "Seasonal settings"
    valueAtStart := 2.5.   "maximum value in November"
    valueAtMid := 1.0.     "minimum value in June"
    valueAtEnd := 2.5.     "return to maximum value in November"

    "Current month of the simulation"
    month := self cormasModel currentMonth.

    "Decline from November (11) to June (6)"
    (month >= 11 or: [month < 6]) ifTrue: [
        "Descending period: November → June"
        slope := (valueAtMid - valueAtStart) / 7.0.  "7 months between November and June"
        month >= 11
            ifTrue: [ value := valueAtStart + slope * (month - 11) ]
            ifFalse: [ value := valueAtStart + slope * (month + 1) ].
        ^ self dailyFishableQuantity: value
    ].

    "Otherwise, ascending period: June → November"
    slope := (valueAtEnd - valueAtMid) / 5.0.  "5 months between June and November"
    value := valueAtMid + slope * (month - 6).

    self dailyFishableQuantity: value
]
