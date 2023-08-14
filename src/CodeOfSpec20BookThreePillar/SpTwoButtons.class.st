Class {
	#name : #SpTwoButtons,
	#superclass : #SpPresenter,
	#instVars : [
		'button1',
		'button2',
		'button3'
	],
	#category : #CodeOfSpec20BookThreePillar
}

{ #category : #'morphic ui' }
SpTwoButtons class >> buttonCol [

	^ SpBoxLayout newTopToBottom
		  add: #button1;
		  add: #button2;
		  add: #button3;
		  yourself
]

{ #category : #'morphic ui' }
SpTwoButtons class >> buttonRow [

	^ SpBoxLayout newLeftToRight
		  add: #button1;
		  add: #button2;
		  add: #button3;
		  yourself
]

{ #category : #layout }
SpTwoButtons >> beCol [

	self layout: self class buttonCol
]

{ #category : #layout }
SpTwoButtons >> beRow [

	self layout: self class buttonRow
]

{ #category : #layout }
SpTwoButtons >> defaultLayout [

	^ SpBoxLayout newTopToBottom
	     spacing: 10;
		  add: button1 expand: false;
		  add: button2 withConstraints: [ :cons | cons height: 80; width: 30];
		  addLast: button3 expand: false;
		  yourself
]

{ #category : #initialization }
SpTwoButtons >> initializePresenters [

	button1 := self newButton.
	button2 := self newButton.
	button3 := self newButton.
	button1 label: '1'.
	button2 label: '2'.
	button3 label: '3'.
]
