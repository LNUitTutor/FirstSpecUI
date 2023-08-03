Class {
	#name : #SpMethodListerWithModel,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'list'
	],
	#category : #'CodeOfSpec20Book2-WithModel'
}

{ #category : #layout }
SpMethodListerWithModel >> defaultLayout [
^ SpBoxLayout newTopToBottom add: #list ; yourself
]

{ #category : #initialization }
SpMethodListerWithModel >> initializePresenters [
list := self newList
]

{ #category : #initialization }
SpMethodListerWithModel >> initializeWindow: aPresenter [

aPresenter title: 'Point >> methods'
]

{ #category : #initialization }
SpMethodListerWithModel >> modelChanged [
list items: self model selectors sorted
]
