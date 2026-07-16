"
recargo (c.v)
"
Class {
	#name : #Credito,
	#superclass : #Pago,
	#classVars : [
		'recargo'
	],
	#category : #'TPO-POO'
}

{ #category : #constructor }
Credito class >> crearFecha: unaFecha montoPago: unMonto [
|unPago|
	recargo := 0.1.
	unPago := super crearFecha: unaFecha montoPago: (unMonto*(1+recargo)).
	^unPago 
	
]
