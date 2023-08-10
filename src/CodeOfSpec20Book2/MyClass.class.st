Class {
	#name : #MyClass,
	#superclass : #Object,
	#instVars : [
		'a',
		'b'
	],
	#category : #'CodeOfSpec20Book2-WithModel'
}

{ #category : #accessing }
MyClass >> a [

	^ a
]

{ #category : #accessing }
MyClass >> a: anObject [

	a := anObject
]

{ #category : #accessing }
MyClass >> b [

	^ b
]

{ #category : #accessing }
MyClass >> b: anObject [

	b := anObject
]

{ #category : #printing }
MyClass >> printOn: aStream [

	super printOn: aStream.
	aStream nextPut: $(.
	a printOn: aStream.
	aStream nextPut: $,.
	b printOn: aStream.
	aStream nextPut: $)
]
