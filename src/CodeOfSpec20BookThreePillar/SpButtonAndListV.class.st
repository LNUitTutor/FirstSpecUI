Class {
	#name : #SpButtonAndListV,
	#superclass : #SpButtonAndListH,
	#category : #CodeOfSpec20BookThreePillar
}

{ #category : #layout }
SpButtonAndListV >> defaultLayout [

	^ SpBoxLayout new
		  add: buttons layout: #buttonCol;
		  add: list;
		  yourself
]
