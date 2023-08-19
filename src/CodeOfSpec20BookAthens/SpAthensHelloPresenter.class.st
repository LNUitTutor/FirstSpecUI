Class {
	#name : #SpAthensHelloPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'morphPresenter'
	],
	#category : #CodeOfSpec20BookAthens
}

{ #category : #layout }
SpAthensHelloPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: morphPresenter;
		  yourself
]

{ #category : #initialization }
SpAthensHelloPresenter >> initializePresenters [

	morphPresenter := self instantiate: SpMorphPresenter.
	morphPresenter morph: AthensHello new
]
