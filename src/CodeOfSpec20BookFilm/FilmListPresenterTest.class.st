Class {
	#name : #FilmListPresenterTest,
	#superclass : #TestCase,
	#instVars : [
		'presenter'
	],
	#category : #CodeOfSpec20BookFilm
}

{ #category : #running }
FilmListPresenterTest >> setUp [
super setUp.
ImdbFilm reset.
ImdbFilm addET.
ImdbFilm addAvatar 

]

{ #category : #running }
FilmListPresenterTest >> tearDown [
presenter ifNotNil: [ presenter delete ].
ImdbFilm restore .
super tearDown
]

{ #category : #tests }
FilmListPresenterTest >> testListIsSimpleSelection [
presenter := ImdbFilmListPresenter new.
presenter open.
self deny: presenter filmList isMultipleSelection

]

{ #category : #tests }
FilmListPresenterTest >> testWhenSelectingOneFilmAndClickingOnEmpty [
| name |
"Prepare"
presenter := ImdbFilmListPresenter new.
presenter open.
"Act"
presenter clickFilmAtIndex: 2.
"Assert"
name := presenter detail name.
self deny: name isEmpty.
self assert: presenter filmList listSize equals: 2.
presenter clickFilmAtIndex: 3.
self assert: presenter detail name equals: name
]

{ #category : #tests }
FilmListPresenterTest >> testWhenSelectingOneFilmThenDetailIsUpdated [

	| detail |
	"Prepare the context"
	presenter := ImdbFilmListPresenter new.
	presenter open.
	detail := presenter detail.
	self assert: detail name isEmpty.
	"Act"
	presenter clickFilmAtIndex: 1.
	"Assert"
	self deny: detail name isEmpty.
	self assert:  detail name equals: ImdbFilm ET name
]
