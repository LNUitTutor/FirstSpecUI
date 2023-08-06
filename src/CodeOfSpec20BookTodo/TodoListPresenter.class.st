Class {
	#name : #TodoListPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'addButton',
		'todoListPresenter'
	],
	#category : #CodeOfSpec20BookTodo
}

{ #category : #actions }
TodoListPresenter >> addTask [

	(TodoNewTaskPresenter newApplication: self application)
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

{ #category : #actions }
TodoListPresenter >> editSelectedTask [

	(TodoEditTaskPresenter newApplication: self application)
		task: todoListPresenter selection selectedItem;
	 	openModal.
	self updatePresenter
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
	todoListPresenter contextMenu: self todoListContextMenu.
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

{ #category : #actions }
TodoListPresenter >> removeSelectedTask [

	todoListPresenter selection selectedItem remove.
	self updatePresenter
]

{ #category : #menus }
TodoListPresenter >> todoListContextMenu [

	^ self newMenu
		  addItem: [ :item |
			  item
				  name: 'Edit...';
				  action: [ self editSelectedTask ] ];
		  addItem: [ :item |
			  item
				  name: 'Remove';
				  action: [ self removeSelectedTask ] ]
]

{ #category : #initialization }
TodoListPresenter >> updatePresenter [

	todoListPresenter items: TodoTask tasks
]
