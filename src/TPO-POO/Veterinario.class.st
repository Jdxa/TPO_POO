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
Veterinario class >> crearNroDni: unNroDoc nombre: unNombre apellido: unApellido domicilio: unDomicilio fechaNac: unaFechaNac CUIL: unCUIL colMatriculas: unaColMatriculas [
|unVeterinario|
unVeterinario := self new.
unVeterinario iniciarPersonaNroDoc: unNroDoc nombre: unNombre apellido: unApellido domicilio: unDomicilio .
unVeterinario iniciarFechaNac:  unaFechaNac CUIL: unCUIL colMatriculas: unaColMatriculas .
^unVeterinario 
]

{ #category : #iniciador }
Veterinario >> iniciarFechaNac: unaFechaNac CUIL: unCUIL colMatriculas: unaColMatriculas [
fechaNac := unaFechaNac .
CUIL := unCUIL .
colMatriculas := unaColMatriculas .
]
