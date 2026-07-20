"
Instance Variables
	cliente:		<Object>
	colPagos:		<Object>
	cuit:		<Object>
	diagnostico:		<Object>
	fechaGen:		<Object>
	montoTotal:		<Object>
"
Class {
	#name : #Factura,
	#superclass : #Object,
	#instVars : [
		'cliente',
		'cuit',
		'diagnostico',
		'montoTotal',
		'fechaGen',
		'colPagos'
	],
	#category : #'TPO-POO'
}

{ #category : #constructor }
Factura class >> crearCliente: unCliente cuit: unCuit diagnostico: unDiagnostico montoTotal: unMontoTotal fechaGen: unaFechaGen [
|unaFactura|
unaFactura := self new.
unaFactura iniciarCliente: unCliente cuit: unCuit diagnostico: unDiagnostico montoTotal: unMontoTotal fechaGen: unaFechaGen.
^unaFactura  
]

{ #category : #propio }
Factura >> estaPagada [

	| montoPagado pagada |
	montoPagado := 0.
	colPagos do: [ :pago | montoPagado := montoPagado + pago montoPago ].
	pagada := montoPagado >= montoTotal.
	^ pagada
]

{ #category : #accessing }
Factura >> getDiagnostico [
 ^ diagnostico 
]

{ #category : #iniciador }
Factura >> iniciarCliente: unCliente cuit: unCuit diagnostico: unDiagnostico montoTotal: unMontoTotal fechaGen: unaFechaGen [ 
	cliente := unCliente.
	cuit := unCuit.
	diagnostico := unDiagnostico .
	montoTotal := unMontoTotal.
	fechaGen := unaFechaGen.
	colPagos := OrderedCollection new
]

{ #category : #iniciador }
Factura >> registrarPago: unPago [
	|pagada|
	pagada := self estaPagada.
	
	pagada ifTrue: [ ^self ]
	ifFalse: [colPagos add: unPago.
		pagada := self estaPagada ].
	^pagada 
]
