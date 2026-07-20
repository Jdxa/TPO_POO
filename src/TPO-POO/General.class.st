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
|unaAnestesia|
unaAnestesia := self new.
costo := 100000.
^unaAnestesia 
]

{ #category : #propio }
General >> esGeneral [ 
 ^ true
]
