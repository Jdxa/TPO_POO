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

{ #category : #iniciador }
Factura >> agregarPago: unPago [
	colPagos add: unPago.
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
