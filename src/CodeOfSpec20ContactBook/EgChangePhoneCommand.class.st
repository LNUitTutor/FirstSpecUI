Class {
	#name : #EgChangePhoneCommand,
	#superclass : #EgContactBookCommand,
	#category : #CodeOfSpec20ContactBook
}

{ #category : #testing }
EgChangePhoneCommand >> canBeExecuted [

	^ self context isContactSelected
]

{ #category : #executing }
EgChangePhoneCommand >> execute [

	self selectedContact phone: self contactBookPresenter newPhone.
	self contactBookPresenter updateView
]

{ #category : #initialization }
EgChangePhoneCommand >> initialize [

	super initialize.
	self
		name: 'Change phone';
		description: 'Change the phone number of the contact.'
]
