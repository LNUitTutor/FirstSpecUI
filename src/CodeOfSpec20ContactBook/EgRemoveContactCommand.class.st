Class {
	#name : #EgRemoveContactCommand,
	#superclass : #EgContactBookCommand,
	#category : #CodeOfSpec20ContactBook
}

{ #category : #converting }
EgRemoveContactCommand >> asSpecCommand [

	^ super asSpecCommand
		  iconName: #removeIcon;
		  shortcutKey: $x meta;
		  yourself
]

{ #category : #testing }
EgRemoveContactCommand >> canBeExecuted [

	^ self context isContactSelected
]

{ #category : #executing }
EgRemoveContactCommand >> execute [

	(self contactBookPresenter
		 confirm: 'Do you want to remove ' , self selectedContact name , '?'
		 label: 'Confirm please') ifFalse: [ ^ self ].
	self contactBook removeContact: self selectedContact.
	self contactBookPresenter updateView
]

{ #category : #initialization }
EgRemoveContactCommand >> initialize [

	super initialize.
	self
		name: 'Remove';
		description: 'Removes the selected contact from the contact book.'
]
