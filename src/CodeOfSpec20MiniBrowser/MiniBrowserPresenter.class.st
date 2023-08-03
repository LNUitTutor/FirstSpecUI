Class {
	#name : #MiniBrowserPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'treeClasses',
		'button',
		'codeShower',
		'methodsList'
	],
	#category : #CodeOfSpec20MiniBrowser
}

{ #category : #'as yet unclassified' }
MiniBrowserPresenter >> buttonAction [

	| newShower |
	button label = 'Edit'
		ifTrue: [
			button label: 'Read only'.
			newShower := self newCode ]
		ifFalse: [
			button label: 'Edit'.
			newShower := self newText beNotEditable ].
	newShower
		text: methodsList selectedItem ast formattedCode.
	self layout replace: codeShower with: newShower.
	codeShower := newShower
]

{ #category : #initialization }
MiniBrowserPresenter >> connectPresenters [

	treeClasses whenActivatedDo: [ :selection |
		methodsList items: selection selectedItem methods ].
	methodsList listPresenter whenSelectedDo: [ :selectedMethod |
		codeShower text: selectedMethod ast formattedCode ].
	button action: [ self buttonAction ]
]

{ #category : #initialization }
MiniBrowserPresenter >> initializeLayout [

	| classesAndMethodsLayout |
	classesAndMethodsLayout := SpBoxLayout newLeftToRight.
	classesAndMethodsLayout
		spacing: 10;
		add: treeClasses;
		add: methodsList.
	self layout: (SpBoxLayout newTopToBottom
			 spacing: 5;
			 add: classesAndMethodsLayout;
			 add: codeShower;
			 add: button expand: false;
			 yourself)
]

{ #category : #initialization }
MiniBrowserPresenter >> initializePresenters [

	treeClasses := self newTree.
	treeClasses
		activateOnSingleClick;
		roots: { Object };
		children: [ :each | each subclasses ];
		displayIcon: [ :each | each iconNamed: each systemIconName ].

	methodsList := self newFilteringList.
	methodsList display: [ :method | method selector ].
	methodsList listPresenter sortingBlock:
		[ :method | method selector ] ascending.

	button := self newButton.
	button
		label: 'Edit';
		icon: (self iconNamed: #smallConfiguration).

	codeShower := self newText.
	codeShower beNotEditable.
	self initializeLayout
]

{ #category : #initialization }
MiniBrowserPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'My Mini Browser';
		initialExtent: 750 @ 650
]
