Class {
	#name : #Local,
	#superclass : #Anestesia,
	#classVars : [
		'costo'
	],
	#category : #'TPO-POO'
}

{ #category : #constructor }
Local class >> crearAne [

	| unaAnestesia |
	unaAnestesia := self new.
	costo := 30000.
	^ unaAnestesia
]

{ #category : #propio }
Local >> esGeneral [

	^ false
]
