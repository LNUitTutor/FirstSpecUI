Class {
	#name : #SpTwoButtons,
	#superclass : #SpPresenter,
	#instVars : [
		'button1',
		'button2'
	],
	#category : #CodeOfSpec20BookThreePillar
}

{ #category : #layout }
SpTwoButtons >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		  add: button1;
		  add: button2;
		  yourself
]

{ #category : #initialization }
SpTwoButtons >> initializePresenters [

	button1 := self newButton.
	button2 := self newButton.
	button1 label: '1'.
	button2 label: '2'
]
