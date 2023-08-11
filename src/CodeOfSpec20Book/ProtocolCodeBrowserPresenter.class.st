Class {
	#name : #ProtocolCodeBrowserPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'text',
		'viewer'
	],
	#category : #'CodeOfSpec20Book-MiniClassBrowser'
}

{ #category : #examples }
ProtocolCodeBrowserPresenter class >> example [

	^ self new open
]

{ #category : #initialization }
ProtocolCodeBrowserPresenter >> connectPresenters [

	viewer whenSelectionInClassChanged: [ :selection |
		text behavior: selection selectedItem ].
	viewer whenSelectionInAPIChanged: [ :selection |
		selection selectedItem ifNotNil: [ :item |
			text text: item sourceCode ] ].
	viewer whenSelectionInEventChanged: [ :selection |
		selection selectedItem ifNotNil: [ :item |
			text text: item sourceCode ] ]
]

{ #category : #layout }
ProtocolCodeBrowserPresenter >> defaultLayout [

	^ SpPanedLayout newTopToBottom
		  "spacing: 5;"
		  add: (SpBoxLayout newHorizontal
				   add: #viewer;
				   yourself);
		  add: #text;
		  yourself
]

{ #category : #initialization }
ProtocolCodeBrowserPresenter >> initializePresenters [

	text := self instantiate: SpCodePresenter.
	viewer := self instantiate: ProtocolViewerPresenter.
	viewer layout: viewer combineLayout.
	text syntaxHighlight: true.
	self focusOrder
		add: viewer;
		add: text
]

{ #category : #initialization }
ProtocolCodeBrowserPresenter >> initializePresenters2 [

	text := self instantiate: SpCodePresenter.
	viewer := self instantiate: ProtocolViewerPresenter.
	text syntaxHighlight: true.
	self focusOrder
		add: viewer;
		add: text
]

{ #category : #initialization }
ProtocolCodeBrowserPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter title: 'Spec Protocol Browser';
	initialExtent: 450@550
]
