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
		'colPagos',
		'estadoPagado'
	],
	#category : #'TPO-POO'
}

{ #category : #constructor }
Factura class >> crearCliente: unCliente cuit: unCuit diagnostico: unDiagnostico montoTotal: unMontoTotal fechaGen: unaFechaGen estadoPagado: estado [

	| unaFactura |
	unaFactura := self new.
	unaFactura iniciarCliente: unCliente
		cuit: unCuit
		diagnostico: unDiagnostico
		montoTotal: unMontoTotal
		fechaGen: unaFechaGen
		estadoPagado: estado.
	^ unaFactura
]

{ #category : #propio }
Factura >> estaPagada [
	^ estadoPagado
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
Factura >> iniciarCliente: unCliente cuit: unCuit diagnostico: unDiagnostico montoTotal: unMontoTotal fechaGen: unaFechaGen estadoPagado: estado [

	cliente := unCliente.
	cuit := unCuit.
	diagnostico := unDiagnostico.
	montoTotal := unMontoTotal.
	fechaGen := unaFechaGen.
	estadoPagado := estado.
	colPagos := OrderedCollection new
]

{ #category : #iniciador }
Factura >> registrarPago: unPago [
	"agregar estado en factura para cambiar el estado de la factura si esta pagada"

	| pagoAcumulado |
	estadoPagado ifTrue: [^self]ifFalse: [
		pagoAcumulado := 0.
		pagoAcumulado := colPagos do: [ :pago |
			                 pagoAcumulado := pagoAcumulado + pago montoPago ].
		estadoPagado := pagoAcumulado >= montoTotal ]
]
