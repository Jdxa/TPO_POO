"
TIENE COSTO
"
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
unaAnestesia iniciarCosto.
	^ unaAnestesia
]

{ #category : #accesing }
Regional >> costo [

	^ costo
]

{ #category : #propio }
Regional >> esGeneral [

	^ false
]

{ #category : #iniciar }
Regional >> iniciarCosto [

	costo := 60000
]
