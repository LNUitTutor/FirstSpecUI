Class {
	#name : #TodoListPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'addButton',
		'todoListPresenter'
	],
	#category : #CodeOfSpec20BookTodo
}

{ #category : #adding }
TodoListPresenter >> addTask [

	(TodoTaskPresenter newApplication: self application)
		task: TodoTask new;
		openModal.
	self updatePresenter
]

{ #category : #layout }
TodoListPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  spacing: 5;
		  add: todoListPresenter;
		  add: (SpBoxLayout newLeftToRight
				   addLast: addButton expand: false;
				   yourself)
		  expand: false;
		  yourself
]

{ #category : #initialization }
TodoListPresenter >> initializePresenters [

	todoListPresenter := self newTable
		    addColumn: ((SpCheckBoxTableColumn evaluated: [ :task | task isDone ]) width: 20;
					onActivation: [ :task | task done: true ];
					onDeactivation: [ :task | task done: false ];
					yourself);
		    addColumn: (SpStringTableColumn title: 'Title'
				                      evaluated: [ :task | task title ]);
			 beResizable;
		    yourself.
	addButton := self newButton label: 'Add task';
			action: [ self addTask ];
			yourself .
]

{ #category : #initialization }
TodoListPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Todo List';
		initialExtent: 500 @ 500
]

{ #category : #initialization }
TodoListPresenter >> updatePresenter [

	todoListPresenter items: TodoTask tasks
]
