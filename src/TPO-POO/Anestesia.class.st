"
Instance Variables
	costo:		<Object>
"
Class {
	#name : #Anestesia,
	#superclass : #Object,
	#instVars : [
		'costo'
	],
	#category : #'TPO-POO'
}

{ #category : #constructor }
Anestesia class >> crearAne [
	^ self subclassResponsibility
]

{ #category : #propio }
Anestesia >> esGeneral [ 
^self subclassResponsibility 
]
