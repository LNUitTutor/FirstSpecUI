Class {
	#name : #ImdbFilmPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'nameText',
		'directorText',
		'yearNumber',
		'nameLabel'
	],
	#category : #CodeOfSpec20BookFilm
}

{ #category : #transmission }
ImdbFilmPresenter >> defaultInputPort [
^ self inputModelPort
]

{ #category : #layout }
ImdbFilmPresenter >> defaultLayout [
	"^ SpGridLayout new
		  add: 'Name' at: 1 @ 1;
		  add: nameText at: 2 @ 1;
		  add: 'Director' at: 1 @ 2;
		  add: directorText at: 2 @ 2;
		  add: 'Year' at: 1 @ 3;
		  add: yearNumber at: 2 @ 3;
		  yourself"

	^ SpGridLayout build: [ :builder |
		  builder
			  beColumnNotHomogeneous;
			  column: 2 withConstraints: #beExpand;
			  "add: 'Name'; changed by the next chunk" add: nameLabel;
			  add: nameText; nextRow;
			  add: 'Director'; add: directorText; nextRow;
			  add: 'Year'; add: yearNumber ]
]

{ #category : #accessing }
ImdbFilmPresenter >> director [

	^ directorText text
]

{ #category : #private }
ImdbFilmPresenter >> editable: aBoolean [

	nameText editable: aBoolean.
	directorText editable: aBoolean.
	yearNumber editable: aBoolean
]

{ #category : #initialization }
ImdbFilmPresenter >> initializeDialogWindow: aDialogPresenter [

	aDialogPresenter centered.
	aDialogPresenter
		addButton: 'Cancel' do: [ :presenter | presenter close ];
		addButton: 'Save Film' do: [ :presenter | presenter	beOk;	close ]
]

{ #category : #initialization }
ImdbFilmPresenter >> initializePresenters [
	"presener with style - just added"
	nameLabel := self newLabel
		             label: 'Name';
		             addStyle: 'customLabel';
		             yourself.
	"stable part"
	nameText := self newTextInput.
	directorText := self newTextInput.
	yearNumber := self newNumberInput
		              rangeMinimum: 1900 maximum: Year current year;
		              yourself
]

{ #category : #initialization }
ImdbFilmPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Film';
		initialExtent: 400 @ 200
]

{ #category : #transmission }
ImdbFilmPresenter >> inputModelPort [
^ SpModelPort newPresenter: self
]

{ #category : #accessing }
ImdbFilmPresenter >> name [

	^ nameText text
]

{ #category : #'accessing - model' }
ImdbFilmPresenter >> setModel: aFilm [
nameText text: aFilm name.
directorText text: aFilm director.
yearNumber number: aFilm year.

]

{ #category : #accessing }
ImdbFilmPresenter >> yearNumber [

	^ yearNumber text
]
