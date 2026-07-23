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
	^ unTratamiento
]

{ #category : #propio }
Tratamiento >> costoTot [
 |unCostoTotal|
unCostoTotal := 5000.
^unCostoTotal 
]

{ #category : #comparacion }
Tratamiento >> esTratValido [

	^ fecha dayOfWeek between: 2 and: 6
]

{ #category : #iniciador }
Tratamiento >> iniciarFecha: unaFecha motivo: unMotivo estado: unEstado [

	fecha := unaFecha.
	motivo := unMotivo.
	estado := unEstado.
]
