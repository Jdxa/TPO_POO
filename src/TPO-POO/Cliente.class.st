Class {
	#name : #Cliente,
	#superclass : #Persona,
	#instVars : [
		'telefono',
		'email',
		'colMascotas'
	],
	#category : #'TPO-POO'
}

{ #category : #constructor }
Cliente class >> crearNroDni: unNroDoc nombre: unNombre apellido: unApellido domicilio: unDomicilio email: unEmail telefono: unTelefono colMascotas: unaColMascotas [

	| unCliente |
	unCliente := self new.
	unCliente
		iniciarPersonaNroDoc: unNroDoc
		nombre: unNombre
		apellido: unApellido
		domicilio: unDomicilio.
	unCliente
		iniciarEmail: unEmail
		telefono: unTelefono
		colMascotas: unaColMascotas.
	
^unCliente 
]

{ #category : #iniciador }
Cliente >> iniciarEmail: unEmail telefono: unTelefono colMascotas: unaColMascotas [
email := unEmail .
telefono := unTelefono .
colMascotas := unaColMascotas .
]
