Class {
	#name : #WindowExamplePresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'button1',
		'button2'
	],
	#category : #'CodeOfSpec20Book2-Windowing'
}

{ #category : #layout }
WindowExamplePresenter >> defaultLayout [
^ SpBoxLayout newLeftToRight
add: #button1; add: #button2; yourself
]

{ #category : #initialization }
WindowExamplePresenter >> initializePresenters [
button1 := self newButton.
button2 := self newButton.
button1 label: '+'.
button2 label: '-'
]
