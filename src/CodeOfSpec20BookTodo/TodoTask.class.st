Class {
	#name : #TodoTask,
	#superclass : #Object,
	#instVars : [
		'done',
		'title'
	],
	#classInstVars : [
		'tasks'
	],
	#category : #CodeOfSpec20BookTodo
}

{ #category : #adding }
TodoTask class >> addTask: aTask [

	(tasks includes: aTask) ifFalse: [ tasks add: aTask ]
]

{ #category : #'as yet unclassified' }
TodoTask class >> deleteTask: aTask [

	tasks remove: aTask ifAbsent: [ nil ]
]

{ #category : #accessing }
TodoTask class >> tasks [

	^ tasks ifNil: [ tasks := OrderedCollection new ]
]

{ #category : #actions }
TodoTask >> delete [

	self class deleteTask: self
]

{ #category : #accessing }
TodoTask >> done [

	^ done
]

{ #category : #accessing }
TodoTask >> done: aBoolean [

	done := aBoolean
]

{ #category : #initialization }
TodoTask >> initialize [

	super initialize.
	self title: 'Please give me a title'.
	self done: false
]

{ #category : #testing }
TodoTask >> isDone [

	^ self done
]

{ #category : #actions }
TodoTask >> save [

	self class addTask: self
]

{ #category : #accessing }
TodoTask >> title [

	^ title
]

{ #category : #accessing }
TodoTask >> title: aString [

	title := aString
]
