Class {
	#name : #SpGridExample,
	#superclass : #SpPresenter,
	#instVars : [
		'nameText',
		'passwordText',
		'acceptButton',
		'cancelButton'
	],
	#category : #CodeOfSpec20BookThreePillar
}

{ #category : #layout }
SpGridExample >> defaultLayout [

	^ SpGridLayout new
		  add: 'Name:' at: 1 @ 1;
		  add: #nameText at: 2 @ 1;
		  add: 'Password:' at: 1 @ 2;
		  add: #passwordText at: 2 @ 2;
		  add: #acceptButton at: 1 @ 3;
		  add: #cancelButton at: 2 @ 3 span: 2 @ 3;
		  add: 'test label' at: 1 @ 4;
		  yourself
]

{ #category : #initialization }
SpGridExample >> initializePresenters [

	nameText := self newTextInput.
	passwordText := self newTextInput.
	acceptButton := self newButton.
	acceptButton label: 'Accept'.
	cancelButton := self newButton.
	cancelButton label: 'Cancel'
]
