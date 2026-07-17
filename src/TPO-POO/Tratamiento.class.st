"
Instance Variables
	estado:		<Object>
	fecha:		<Object>
	motivo:		<Object>
"
Class {
	#name : #Tratamiento,
	#superclass : #Object,
	#instVars : [
		'fecha',
		'motivo',
		'estado'
	],
	#classVars : [
		'costoBase'
	],
	#category : #'TPO-POO'
}

{ #category : #constructor }
Tratamiento class >> crearFecha: unaFecha motivo: unMotivo estado: unEstado [

	| unTratamiento |
	unTratamiento := self new.
	unTratamiento
		iniciarFecha: unaFecha
		motivo: unMotivo
		estado: unEstado.
	costoBase := 5000.
	^ unTratamiento
]

{ #category : #comparacion }
Tratamiento >> esValido [

	^ fecha dayOfWeek between: 2 and: 6
]

{ #category : #iniciador }
Tratamiento >> iniciarFecha: unaFecha motivo: unMotivo estado: unEstado [
	fecha := unaFecha .
	motivo := unMotivo .
	estado := unEstado  
]
