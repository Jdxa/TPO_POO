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

{ #category : #accessing }
Anestesia >> costo [

	^ costo
]

{ #category : #accessing }
Anestesia >> costo: anObject [

	costo := anObject
]

{ #category : #propio }
Anestesia >> esGeneral [ 
^self subclassResponsibility 
]
