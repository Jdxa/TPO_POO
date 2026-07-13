Class {
	#name : #Persona,
	#superclass : #Object,
	#instVars : [
		'nroDoc',
		'nombre',
		'apellido',
		'domicilio'
	],
	#category : #'TPO-POO'
}

{ #category : #constructor }
Persona class >> crearNroDni: unNroDoc nombre: unNombre apellido: unApellido domicilio: unDomicilio [

	| unaPersona |
	unaPersona := self new.
	unaPersona
		iniciarPersonaNroDoc: unNroDoc
		nombre: unNombre
		apellido: unApellido
		domicilio: unDomicilio.
	^ unaPersona
]

{ #category : #iniciadores }
Persona >> iniciarPersonaNroDoc: unNroDoc nombre: unNombre apellido: unApellido domicilio: unDomicilio [
	nroDoc := unNroDoc .
	nombre := unNombre .
	apellido := unApellido .
	domicilio := unDomicilio .
]
