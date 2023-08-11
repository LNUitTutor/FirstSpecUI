Class {
	#name : #ProtocolMethodListPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'label',
		'methods'
	],
	#category : #'CodeOfSpec20Book-MiniClassBrowser'
}

{ #category : #layout }
ProtocolMethodListPresenter >> defaultLayout [

	^ SpBoxLayout newVertical
		  add: #label withConstraints: [ :c | c expand: false ];
		  add: #methods withConstraints: [ :c | c fill: true ];
		  yourself
]

{ #category : #initialization }
ProtocolMethodListPresenter >> initializePresenters [

	methods := self newList.
	methods display: [ :m | m selector ].
	label := self newLabel.
	label label: 'Protocol'.
	self focusOrder add: methods
]

{ #category : #initialization }
ProtocolMethodListPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter title: 'Protocol widget'
]

{ #category : #api }
ProtocolMethodListPresenter >> items: aCollection [

	methods items: aCollection
]

{ #category : #api }
ProtocolMethodListPresenter >> label: aText [

	label label: aText
]

{ #category : #api }
ProtocolMethodListPresenter >> resetSelection [

	methods selection unselectAll
]

{ #category : #api }
ProtocolMethodListPresenter >> whenSelectionChangedDo: aBlock [

	methods whenSelectionChangedDo: aBlock
]
