Class {
	#name : #SpButtonAndListH,
	#superclass : #SpPresenter,
	#instVars : [
		'buttons',
		'list'
	],
	#category : #CodeOfSpec20BookThreePillar
}

{ #category : #layout }
SpButtonAndListH >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		  add: buttons;
		  add: list;
		  yourself
]

{ #category : #initialization }
SpButtonAndListH >> initializePresenters [

	buttons := self instantiate: SpTwoButtons.
	list := self newList.
	list items: (1 to: 10)
]

{ #category : #initialization }
SpButtonAndListH >> initializeWindow: aWindowPresenter [

	aWindowPresenter title: 'SuperWidget'
]
