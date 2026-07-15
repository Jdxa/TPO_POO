"
Instance Variables
	CUIL:		<Object>
	colMatriculas:		<Object>
	fechaNac:		<Object>
"
Class {
	#name : #Veterinario,
	#superclass : #Persona,
	#instVars : [
		'fechaNac',
		'CUIL',
		'colMatriculas'
	],
	#category : #'TPO-POO'
}

{ #category : #constructor }
Veterinario class >> crearNroDni: unNroDoc nombre: unNombre apellido: unApellido domicilio: unDomicilio fechaNac: unaFechaNac CUIL: unCUIL [ 

	| unVeterinario |
	unVeterinario := self new.
	unVeterinario
		iniciarPersonaNroDoc: unNroDoc
		nombre: unNombre
		apellido: unApellido
		domicilio: unDomicilio.
	unVeterinario
		iniciarFechaNac: unaFechaNac
		CUIL: unCUIL.
	^ unVeterinario
]

{ #category : #iniciador }
Veterinario >> añadirMatricula: unaMatricula [
	colMatriculas add: unaMatricula .
]

{ #category : #iniciador }
Veterinario >> iniciarFechaNac: unaFechaNac CUIL: unCUIL [

	fechaNac := unaFechaNac.
	CUIL := unCUIL.
	colMatriculas := OrderedCollection new.
]
