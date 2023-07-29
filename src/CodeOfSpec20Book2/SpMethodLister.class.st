Class {
	#name : #SpMethodLister,
	#superclass : #SpPresenter,
	#instVars : [
		'aClass',
		'list'
	],
	#category : #CodeOfSpec20Book2
}

{ #category : #layout }
SpMethodLister >> defaultLayout [
^ SpBoxLayout newTopToBottom add: #list ; yourself
]

{ #category : #initialization }
SpMethodLister >> initializePresenters [
list := self newList.
list items: aClass selectors sorted
]

{ #category : #'accessing - model' }
SpMethodLister >> setModelBeforeInitialization: aModel [
aClass := aModel

]
