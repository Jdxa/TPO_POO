"
Instance Variables
	fechaPago:		<Object>
	medioPago:		<Object>
	montoPago:		<Object>
"
Class {
	#name : #Pago,
	#superclass : #Object,
	#instVars : [
		'fechaPago',
		'montoPago',
		'medioPago'
	],
	#category : #'TPO-POO'
}

{ #category : #constructor }
Pago class >> crearFecha: unaFecha montoPago: unMonto [

	| unPago |
	unPago := self new.
	unPago iniciarFecha: unaFecha montoPago: unMonto.
	^ unPago
]

{ #category : #iniciador }
Pago >> iniciarFecha: unaFechaPago montoPago: unMontoPago [

	fechaPago := unaFechaPago.
	montoPago := unMontoPago
]
