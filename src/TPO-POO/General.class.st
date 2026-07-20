"
TIENE COSTO
"
Class {
	#name : #General,
	#superclass : #Anestesia,
	#classVars : [
		'costo'
	],
	#category : #'TPO-POO'
}

{ #category : #constructor }
General class >> crearAne [

	| unaAnestesia |
	unaAnestesia := self new.
	unaAnestesia iniciarCosto.
	^ unaAnestesia
]

{ #category : #accesing }
General >> costo [
^costo
]

{ #category : #propio }
General >> esGeneral [ 
 ^ true
]

{ #category : #iniciar }
General >> iniciarCosto [
	costo := 100000.
]
