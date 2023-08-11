Class {
	#name : #WidgetClassListPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'list'
	],
	#category : #'CodeOfSpec20Book-MiniClassBrowser'
}

{ #category : #layout }
WidgetClassListPresenter >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		  add: #list;
		  yourself
]

{ #category : #initialization }
WidgetClassListPresenter >> initializePresenters [

	list := self newList.
	list items:
		(SpAbstractWidgetPresenter allSubclasses sorted: [ :a :b |
			 a name < b name ]).
	self focusOrder add: list "optional"
]

{ #category : #initialization }
WidgetClassListPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter title: 'Widgets'
]

{ #category : #enumerating }
WidgetClassListPresenter >> whenSelectionChangedDo: aBlock [

	list whenSelectionChangedDo: aBlock
]
