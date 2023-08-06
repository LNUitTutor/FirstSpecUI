Class {
	#name : #EgPrintContactCommand,
	#superclass : #EgContactBookCommand,
	#category : #CodeOfSpec20ContactBook
}

{ #category : #executing }
EgPrintContactCommand >> execute [

	Transcript open.
	self contactBook contents do: [ :contact |
		self traceCr: contact name , ' - ' , contact phone ]
]

{ #category : #initialization }
EgPrintContactCommand >> initialize [

	super initialize.
	self
		name: 'Print';
		description: 'Print the contact book in Transcript.'
]
