Class {
	#name : #TodoApplication,
	#superclass : #SpApplication,
	#category : #CodeOfSpec20BookTodo
}

{ #category : #running }
TodoApplication >> start [

	TodoListPresenter new open
]
