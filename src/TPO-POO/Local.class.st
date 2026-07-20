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
unaAnestesia iniciarCosto.
	^ unaAnestesia
]

{ #category : #accesing }
Local >> costo [

	^ costo
]

{ #category : #propio }
Local >> esGeneral [

	^ false
]

{ #category : #iniciar }
Local >> iniciarCosto [

	costo := 30000
]
