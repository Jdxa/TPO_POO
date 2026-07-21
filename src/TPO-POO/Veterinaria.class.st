"
Instance Variables
	colAplicaciones:		<Object>
	colCliente:		<Object>
	colDiagnostico:		<Object>
	colFacturas:		<Object>
	colMonodrogas:		<Object>
	colTurnos:		<Object>
	colVeterinario:		<Object>
	cuit:		<Object>
"
Class {
	#name : #Veterinaria,
	#superclass : #Object,
	#instVars : [
		'cuit',
		'colVeterinario',
		'colCliente',
		'colDiagnostico',
		'colFacturas',
		'colMonodrogas',
		'colAplicaciones',
		'colTurnos'
	],
	#category : #'TPO-POO'
}

{ #category : #constructor }
Veterinaria class >> crearCuit: unCuit [
|unaVeterinaria|
unaVeterinaria := self new.
unaVeterinaria iniciarCuit: unCuit .
^unaVeterinaria 
]

{ #category : #propio }
Veterinaria >> agendarTurno: unTurno [
	|turnosFecha turnosVeterinario sePuede|
	turnosFecha := colTurnos select: [ unTurno hora and: unTurno fecha].
	turnosVeterinario := turnosFecha select: [ unTurno veterinario ].
	sePuede := turnosFecha isEmpty.
	sePuede ifFalse: [ ^sePuede  ] ifTrue: [ colTurnos add: unTurno ]
	
]

{ #category : #propio }
Veterinaria >> agregarFactura: unaFactura [
colFacturas add: unaFactura.

]

{ #category : #visualizer }
Veterinaria >> buscarCliente: unaMascota [

	| unCliente |
	unCliente := colCliente detect: [ :cliente |
		             cliente buscarMascota: unaMascota ].

	^ unCliente
]

{ #category : #propio }
Veterinaria >> facturasPendientes [

	| pendientes |
	pendientes := colFacturas reject: [ :factura | factura estaPagada ].
	pendientes := pendientes collect: [ :factura |
		              {
			              factura cliente.
			              factura pagoPendiente } ].
	^pendientes 	
]

{ #category : #propio }
Veterinaria >> generarFactura: unDiagnostico [

	| existe cliente montoTotal unaFactura |
	existe := colFacturas anySatisfy: [ :factura |
		          unDiagnostico = factura getDiagnostico ].
	existe
		ifTrue: [ ^ self ]
		ifFalse: [
			cliente := self buscarCliente: unDiagnostico getMascota.
			montoTotal := unDiagnostico calcularCosto.
			unaFactura := Factura
				              crearCliente: cliente
				              cuit: cuit
				              diagnostico: unDiagnostico
				              montoTotal: montoTotal
				              fechaGen: Date today
										estadoPagado: false.
			colFacturas add: unaFactura ]
]

{ #category : #propio }
Veterinaria >> generarListadoFaltantes [
|listaFaltantes|
listaFaltantes := colMonodrogas reject: [ :monodroga | monodroga tieneStock ].
^listaFaltantes  
]

{ #category : #iniciador }
Veterinaria >> iniciarCuit: unCuit [
cuit := unCuit.
colVeterinario := OrderedCollection new.
colCliente := OrderedCollection new.
colDiagnostico := OrderedCollection new.
colFacturas := OrderedCollection new.
colMonodrogas := OrderedCollection new.
colAplicaciones := OrderedCollection new.
colTurnos := OrderedCollection new.

]
