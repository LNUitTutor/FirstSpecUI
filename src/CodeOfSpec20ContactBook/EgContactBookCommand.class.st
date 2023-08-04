Class {
	#name : #EgContactBookCommand,
	#superclass : #CmCommand,
	#category : #CodeOfSpec20ContactBook
}

{ #category : #accessing }
EgContactBookCommand >> contactBook [

	^ self contactBookPresenter contactBook
]

{ #category : #accessing }
EgContactBookCommand >> contactBookPresenter [

	^ self context
]

{ #category : #testing }
EgContactBookCommand >> hasSelectedContact [

	^ self contactBookPresenter isContactSelected
]

{ #category : #'accessing - model' }
EgContactBookCommand >> selectedContact [

	^ self contactBookPresenter selectedContact
]
