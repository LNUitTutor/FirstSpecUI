Class {
	#name : #EgContactBookPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'table',
		'contactBook'
	],
	#category : #CodeOfSpec20ContactBook
}

{ #category : #examples }
EgContactBookPresenter class >> coworkersExample [

	<example>
	^ (self on: EgContactBook coworkers) open
]

{ #category : #examples }
EgContactBookPresenter class >> familyExample [

	<example>
	^ (self on: EgContactBook family) open
]

{ #category : #accessing }
EgContactBookPresenter >> contactBook [

	^ contactBook
]

{ #category : #layout }
EgContactBookPresenter >> defaultLayout [

	^ self defaultSpec
]

{ #category : #specs }
EgContactBookPresenter >> defaultSpec [

	^ SpBoxLayout newVertical
		  add: #table;
		  yourself
]

{ #category : #initialization }
EgContactBookPresenter >> initializePresenters [

	table := self newTable.
	table
		addColumn: (SpStringTableColumn title: 'Name' evaluated: #name);
		addColumn: (SpStringTableColumn title: 'Phone' evaluated: #phone).
	table items: contactBook contents
]

{ #category : #testing }
EgContactBookPresenter >> isContactSelected [

	^ table selectedItems isNotEmpty
]

{ #category : #'instance creation' }
EgContactBookPresenter >> newContact [

	| rawData splitted |
	rawData := self
		           request: 'Enter new contact name and phone (split by comma)'
		           initialAnswer: ''
		           title: 'Create new contact'.
	splitted := rawData splitOn: $,.
	(splitted size = 2 and: [ splitted allSatisfy: #isNotEmpty ])
		ifFalse: [
			SpInvalidUserInput signal: 'Please enter contact name and phone (split by comma)' ].
	^ EgContact name: splitted first phone: splitted second
]

{ #category : #'accessing - model' }
EgContactBookPresenter >> selectedContact [

	^ table selection selectedItem
]

{ #category : #'accessing - model' }
EgContactBookPresenter >> setModelBeforeInitialization: aContactBook [

	super setModelBeforeInitialization: aContactBook.
	contactBook := aContactBook
]

{ #category : #accessing }
EgContactBookPresenter >> table [

	^ table
]

{ #category : #accessing }
EgContactBookPresenter >> table: anObject [

	table := anObject
]
