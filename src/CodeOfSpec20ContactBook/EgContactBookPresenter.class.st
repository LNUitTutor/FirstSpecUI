Class {
	#name : #EgContactBookPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'table',
		'contactBook',
		'menuBar'
	],
	#category : #CodeOfSpec20ContactBook
}

{ #category : #commands }
EgContactBookPresenter class >> buildCommandsGroupWith: presenter forRoot: rootCommandGroup [

	rootCommandGroup
		register: (self buildMenuBarGroupWith: presenter);
		register: (EgAddContactCommand forSpec context: presenter);
		register: (EgRemoveContactCommand forSpec context: presenter)
]

{ #category : #commands }
EgContactBookPresenter class >> buildMenuBarGroupWith: presenter [

	^ (CmCommandGroup named: 'Contact') asSpecGroup
		  register: (EgPrintContactCommand forSpec context: presenter);
		  yourself
]

{ #category : #commands }
EgContactBookPresenter class >> changePhoneCommandWith: presenter forRootGroup: aRootCommandsGroup [

	<extensionCommands>
	aRootCommandsGroup register:
		(EgChangePhoneCommand forSpec context: presenter)
]

{ #category : #examples }
EgContactBookPresenter class >> coworkersExample [

	<example>
	^ (self on: EgContactBook coworkers) open
]

{ #category : #commands }
EgContactBookPresenter class >> extraCommandsWith: presenter forRootGroup: aRootCommandsGroup [

	<extensionCommands>
	aRootCommandsGroup register:
		((CmCommandGroup named: 'Extra') asSpecGroup
			 description: 'Extra commands to help during development.';
			 register:
				 ((EgInspectCommand forSpec context: [ presenter selectedContact ])
					  name: 'Inspect contact';
					  description: 'Open an inspector on the selected contact.';
					  iconName: #smallFind;
					  yourself);
			 register:
				 ((EgInspectCommand forSpec context: [ presenter contactBook ])
					  name: 'Inspect contact book';
					  description: 'Open an inspector on the contact book.';
					  yourself);
			 yourself)
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

	^ SpBoxLayout newVertical
		  add: #menuBar withConstraints: [ :constraints |
			  constraints height: SpAbstractPresenter toolbarHeight ];
		  add: #table;
		  yourself
]

{ #category : #initialization }
EgContactBookPresenter >> initializePresenters [

	table := self newTable.
	table
		addColumn: (SpStringTableColumn title: 'Name' evaluated: #name);
		addColumn: (SpStringTableColumn title: 'Phone' evaluated: #phone).
	table contextMenu: [ self rootCommandsGroup beRoot asMenuPresenter ].
	table items: contactBook contents.
	menuBar := (self rootCommandsGroup / 'Contact') asMenuBarPresenter.

]

{ #category : #initialization }
EgContactBookPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	aWindowPresenter title: 'My tiny contactbook'.
	self rootCommandsGroup installShortcutsIn: aWindowPresenter
]

{ #category : #testing }
EgContactBookPresenter >> isContactSelected [

	^ table selectedItems isNotEmpty
]

{ #category : #'instance creation' }
EgContactBookPresenter >> newContact [

	| rawData splitted |
	[rawData := self
		           request: 'Enter new contact name and phone (split by comma)'
		           initialAnswer: ''
		           title: 'Create new contact'.] on: SpCancelledInteractionError
															 do: [ :ex | ^ nil ].
	splitted := rawData splitOn: $,.
	(splitted size = 2 and: [ splitted allSatisfy: #isNotEmpty ])
		ifFalse: [
			SpInvalidUserInput signal: 'Please enter contact name and phone (split by comma)' ].
	^ EgContact name: splitted first phone: splitted second
]

{ #category : #'instance creation' }
EgContactBookPresenter >> newPhone [

	| phone |
	phone := self
		         request: 'New phone for the contact'
		         initialAnswer: self selectedContact phone
		         title: 'Set new phone for contact'.
	(phone matchesRegex: '\d\d\d\s\d\d\d') ifFalse: [
		SpInvalidUserInput signal:
			'The phone number is not well formated. Should match "\d\d\d\s\d\d\d"' ].
	^ phone
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

{ #category : #'accessing - model' }
EgContactBookPresenter >> updateView [

	table items: contactBook contents
]
