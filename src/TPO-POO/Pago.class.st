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

{ #category : #accessing }
Pago >> fechaPago [

	^ fechaPago
]

{ #category : #accessing }
Pago >> fechaPago: anObject [

	fechaPago := anObject
]

{ #category : #iniciador }
Pago >> iniciarFecha: unaFechaPago montoPago: unMontoPago [

	fechaPago := unaFechaPago.
	montoPago := unMontoPago
]

{ #category : #accessing }
Pago >> medioPago [

	^ medioPago
]

{ #category : #accessing }
Pago >> medioPago: anObject [

	medioPago := anObject
]

{ #category : #accessing }
Pago >> montoPago [

	| unNuevoMonto |
	unNuevoMonto := montoPago.
	medioPago = 'Credito'
		ifTrue: [ unNuevoMonto := montoPago * 0.9 ]
		ifFalse: [
			medioPago = 'Billetera' ifTrue: [ unNuevoMonto := montoPago  * 0.95 ] ].
	^ unNuevoMonto
]

{ #category : #accessing }
Pago >> montoPago: anObject [

	montoPago := anObject
]
