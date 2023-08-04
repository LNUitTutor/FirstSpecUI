Class {
	#name : #EgContactBook,
	#superclass : #Object,
	#instVars : [
		'contacts'
	],
	#classInstVars : [
		'family',
		'coworkers'
	],
	#category : #CodeOfSpec20ContactBook
}

{ #category : #accessing }
EgContactBook class >> coworkers [

	^ coworkers ifNil: [
		  coworkers := self new
			               add: 'Stef' phone: '112 378';
			               add: 'Pavel' phone: '898 678';
			               add: 'Marcus' phone: '444 888';
			               yourself ]
]

{ #category : #accessing }
EgContactBook class >> family [

	^ family ifNil: [
		  family := self new
			            add: 'John' phone: '342 345';
			            add: 'Bill' phone: '123 678';
			            add: 'Marry' phone: '789 567';
			            yourself ]
]

{ #category : #initialization }
EgContactBook class >> reset [

	<script>
	coworkers := nil.
	family := nil
]

{ #category : #adding }
EgContactBook >> add: contactName phone: phone [

	| contact |
	contact := EgContact name: contactName phone: phone.
	self addContact: contact.
	^ contact
]

{ #category : #adding }
EgContactBook >> addContact: aContact [

	contacts add: aContact
]

{ #category : #adding }
EgContactBook >> addContact: newContact after: contactAfter [

	contacts add: newContact after: contactAfter
]

{ #category : #accessing }
EgContactBook >> contents [
	^ contacts 
]

{ #category : #testing }
EgContactBook >> findContactsWithText: aText [

	^ contacts select: [ :e | e hasMatchingText: aText ]
]

{ #category : #testing }
EgContactBook >> includesContact: aContact [

	^ contacts includes: aContact
]

{ #category : #initialization }
EgContactBook >> initialize [

	super initialize.
	contacts := OrderedCollection new
]

{ #category : #removing }
EgContactBook >> removeContact: aContact [

	contacts remove: aContact
]

{ #category : #accessing }
EgContactBook >> size [

	^ contacts size
]
