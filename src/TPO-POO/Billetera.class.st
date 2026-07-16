"
recargo (c.v)
"
Class {
	#name : #Billetera,
	#superclass : #Pago,
	#classVars : [
		'recargo'
	],
	#category : #'TPO-POO'
}

{ #category : #constructor }
Billetera class >> crearFecha: unaFecha montoPago: unMonto [
|unPago|
	recargo := 0.05.
	unPago := super crearFecha: unaFecha montoPago: (unMonto*(1+recargo)).
	^unPago 
]
