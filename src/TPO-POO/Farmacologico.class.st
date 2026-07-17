"
Instance Variables
	dosis:		<Object>
	frecuencia:		<Object>
	nombreMonodroga:		<Object>
	valorMonodroga:		<Object>
	ventaLibre:		<Object>
"
Class {
	#name : #Farmacologico,
	#superclass : #Tratamiento,
	#instVars : [
		'monodroga',
		'dosis',
		'frecuencia'
	],
	#category : #'TPO-POO'
}

{ #category : #constructor }
Farmacologico class >> crearFecha: unaFecha motivo: unMotivo estado: unEstado monodroga: unaMonodroga dosis: unaDosis frecuencia: unaFrecuencia [

	| unTratamiento |
	unTratamiento := self new.
	unTratamiento
		iniciarFecha: unaFecha
		motivo: unMotivo
		estado: unEstado.
	unTratamiento iniciarMonodroga: unaMonodroga dosis: unaDosis frecuencia: unaFrecuencia.
	^ unTratamiento
]

{ #category : #comparacion }
Farmacologico >> esValido [

	| exito |
	exito := monodroga esVentaLibre.
	[ exito ] ifFalse: [ exito := super esValido ].
	^ exito
]

{ #category : #iniciador }
Farmacologico >> iniciarMonodroga: unaMonodroga dosis: unaDosis frecuencia: unaFrecuencia [
	monodroga := unaMonodroga.
	dosis := unaDosis.
	frecuencia := unaFrecuencia 
]
