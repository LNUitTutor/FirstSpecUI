Class {
	#name : #ImdbFilmListPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'filmList',
		'detail'
	],
	#category : #CodeOfSpec20BookFilm
}

{ #category : #adding }
ImdbFilmListPresenter >> addFilm [
	"empty for now"

	| presenter windowPresenter |
	presenter := ImdbFilmPresenter newApplication: self application.
	windowPresenter := presenter openModal.
	windowPresenter isOk ifFalse: [ ^ self ].
	ImdbFilm addFilm: (ImdbFilm new
			 name: presenter name;
			 director: presenter director;
			 year: presenter yearNumber).
	self updatePresenter
]

{ #category : #testing }
ImdbFilmListPresenter >> clickFilmAtIndex: anIndex [ 
	filmList clickAtIndex: anIndex
]

{ #category : #initialization }
ImdbFilmListPresenter >> connectPresenters [
filmList whenSelectionChangedDo: [ :selectedItemMode |
selectedItemMode isEmpty
ifFalse: [ detail setModel: selectedItemMode
selectedItem ] ].

]

{ #category : #layout }
ImdbFilmListPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: filmList;
		  add: detail;
		  yourself
]

{ #category : #accessing }
ImdbFilmListPresenter >> detail [
	^ detail
]

{ #category : #accessing }
ImdbFilmListPresenter >> filmList [

	^ filmList
]

{ #category : #layout }
ImdbFilmListPresenter >> initializePresenters [

	filmList := self newTable
		 addColumn: (SpStringTableColumn title: 'Name' evaluated: #name);
		 addColumn: (SpStringTableColumn title: 'Director' evaluated: #director);
		 addColumn: (SpStringTableColumn title: 'Year' evaluated: #year);
		 yourself.
	detail := self instantiate: ImdbFilmPresenter.
	detail editable: false.
]

{ #category : #initialization }
ImdbFilmListPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Mini IMDB';
		initialExtent: 600 @ 400;
		toolbar: (self newToolbar
				 add: (self newToolbarButton
						  label: 'Add film';
						  icon: (self iconNamed: #smallAdd);
						  action: [ self addFilm ];
						  yourself);
				 yourself)
]

{ #category : #layout }
ImdbFilmListPresenter >> updatePresenter [

	filmList items: ImdbFilm films
]
