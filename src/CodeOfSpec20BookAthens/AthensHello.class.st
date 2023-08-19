Class {
	#name : #AthensHello,
	#superclass : #Morph,
	#instVars : [
		'surface'
	],
	#category : #CodeOfSpec20BookAthens
}

{ #category : #'instance creation' }
AthensHello class >> open [

	<script>
	self new openInWindow
]

{ #category : #accessing }
AthensHello >> defaultExtent [

	^ 400 @ 400
]

{ #category : #drawing }
AthensHello >> drawOn: aCanvas [

	self renderAthens.
	surface displayOnMorphicCanvas: aCanvas at: bounds origin
]

{ #category : #initialization }
AthensHello >> initialize [

	super initialize.
	self extent: self defaultExtent.
	surface := AthensCairoSurface extent: self extent
]

{ #category : #'instance creation' }
AthensHello >> open [
<script: 'self new openInWindow'>
]

{ #category : #rendering }
AthensHello >> renderAthens [

	| font |
	font := LogicalFont familyName: 'Arial' pointSize: 10.
	surface drawDuring: [ :canvas |
		surface clear.
		canvas setPaint:
			((LinearGradientPaint from: 0 @ 0 to: self extent) colorRamp: {
					 (0 -> Color white).
					 (1 -> Color black) }).
		canvas drawShape: (0 @ 0 extent: self extent).
		canvas setFont: font.
		canvas setPaint: Color pink.
		canvas pathTransform
			translateX: 50 Y: 350 + font getPreciseAscent;
			scaleBy: 2;
			rotateByDegrees: -45.
		canvas drawString: 'Hello Athens in Pharo/Morphic' ]
]
