Class {
	#name : #EgInspectCommand,
	#superclass : #EgContactBookCommand,
	#category : #CodeOfSpec20ContactBook
}

{ #category : #executing }
EgInspectCommand >> execute [

	self context inspect
]

{ #category : #initialization }
EgInspectCommand >> initialize [

	super initialize.
	self
		name: 'Inspect';
		description: 'Inspect the context of this command.'
]
