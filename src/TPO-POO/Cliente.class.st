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
Cliente class >> crearClienteDNI: unDni nombre: unNombre apellido: unApellido [

	| unCliente |
	unCliente := self new.
	unCliente
		iniciarClienteDNI: unDni
		nombre: unNombre
		apellido: unApellido
		cuenta: Cuenta new.
	^ unCliente
]

{ #category : #accessing }
Cliente >> apellido [

	^ apellido
]

{ #category : #accessing }
Cliente >> apellido: anObject [

	apellido := anObject
]

{ #category : #accessing }
Cliente >> nombre [

	^ nombre
]

{ #category : #accessing }
Cliente >> nombre: anObject [

	nombre := anObject
]
