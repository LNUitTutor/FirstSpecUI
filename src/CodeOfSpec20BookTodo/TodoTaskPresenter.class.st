Class {
	#name : #TodoTaskPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'task',
		'titlePresenter',
		'caption'
	],
	#category : #CodeOfSpec20BookTodo
}

{ #category : #visiting }
TodoTaskPresenter >> accept [

	task title: titlePresenter text; save
]

{ #category : #visiting }
TodoTaskPresenter >> caption [

	"^ self subclassResponsibility "
	^ String empty 
]

{ #category : #initialization }
TodoTaskPresenter >> initializeDialogWindow: aDialogWindowPresenter [

	aDialogWindowPresenter
		title: "self" caption;
		initialExtent: 350 @ 120;
		addButton: 'Accept' do: [ :dialog | self accept. dialog close ];
		addButton: 'Cancel' do: [ :dialog | dialog close ].
]

{ #category : #initialization }
TodoTaskPresenter >> initializePresenters [

	titlePresenter := self newTextInput";
			whenDisplayDo: [ :presenter | presenter selectPrompt ]".
	self layout: (SpBoxLayout newTopToBottom
			 add: titlePresenter expand: false;
			 yourself)
]

{ #category : #'accessing - model' }
TodoTaskPresenter >> setModelBeforeInitialization: aString [

	caption := aString
]

{ #category : #accessing }
TodoTaskPresenter >> task: aTask [

	task := aTask.
	self updatePresenter
]

{ #category : #initialization }
TodoTaskPresenter >> updatePresenter [

	task ifNotNil: [ titlePresenter text: (task title ifNil: [ '' ]) ]
]
