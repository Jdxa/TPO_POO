Class {
	#name : #Regional,
	#superclass : #Anestesia,
	#classVars : [
		'costo'
	],
	#category : #'TPO-POO'
}

{ #category : #constructor }
Regional class >> crearAne [

	| unaAnestesia |
	unaAnestesia := self new.
	costo := 60000.
	^ unaAnestesia
]

{ #category : #propio }
Regional >> esGeneral [

	^ false
]
