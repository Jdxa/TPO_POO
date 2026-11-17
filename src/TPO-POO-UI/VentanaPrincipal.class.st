Class {
	#name : #VentanaPrincipal,
	#superclass : #Morph,
	#instVars : [
		'modelo',
		'listaClientes',
		'textoCantidad'
	],
	#category : #'TPO-POO-UI'
}

{ #category : #abrir }
VentanaPrincipal class >> abrir [
^ self new openInWorld 
]

{ #category : #initialize }
VentanaPrincipal >> agregarBoton: unTexto accion: unSelector posicion: unPunto [
	|boton|
	
	boton :=  SimpleButtonMorph new.
	boton label: unTexto.
	boton target: self.
	boton actionSelector: unSelector.
	boton extent: 180@35.
	boton position: unPunto.
	
	self addMorph: boton. 
	
]

{ #category : #initialize }
VentanaPrincipal >> agregarBotones [

	self
		agregarBoton: 'Registar Cliente'
		accion: #registrarCliente
		posicion: 30 @ 200.
	self
		agregarBoton: 'Registrar Mascota'
		accion: #registrarMascota
		posicion: 230 @ 200.
	self
		agregarBoton: 'Registrar Diagnostico'
		accion: #registrarDiagnostico
		posicion: 430 @ 200.
	self
		agregarBoton: 'Asignar Tratamiento'
		accion: #asignarTratamiento
		posicion: 30 @ 250.
	self
		agregarBoton: 'Facturar Diagnostico'
		accion: #facturarDiagnostico
		posicion: 230 @ 250.

	self
		agregarBoton: 'Registrar Pago'
		accion: #registrarPago
		posicion: 430 @ 250.

	self
		agregarBoton: 'Historial Clinico'
		accion: #consultarHistorial
		posicion: 30 @ 300.
	self
		agregarBoton: 'Consultar tratamientos'
		accion: #consultarTratamientos
		posicion: 230 @ 300.

	self
		agregarBoton: 'Facturas Pendientes'
		accion: #consultarFacturas
		posicion: 430 @ 300.
	self
		agregarBoton: 'Consultar recaudacion'
		accion: #consultarRecaudacion
		posicion: 30 @ 350
]

{ #category : #initialize }
VentanaPrincipal >> agregarCantidadMascotas [

	| titulo |
	titulo := StringMorph new.
	titulo contents: 'CANTIDAD DE MASCOTAS'.
	titulo position: 450 @ 80.

	self addMorph: titulo.
	textoCantidad  := StringMorph new.
	textoCantidad  contents: '0'.
	textoCantidad  position: 450@ 120.

	self addMorph: textoCantidad 
]

{ #category : #initialize }
VentanaPrincipal >> agregarListaClientes [

	| titulo |
	titulo := StringMorph new.
	titulo contents: 'CLIENTES REGISTRADOS'.
	titulo position: 30 @ 80.

	self addMorph: titulo.

	listaClientes := StringMorph new.
	listaClientes contents: 'La lista de clientes aparecera aqui'.
	listaClientes position: 30 @ 120.
	
	self addMorph: listaClientes.
]

{ #category : #initialize }
VentanaPrincipal >> agregarTitulo [
|titulo|

titulo := StringMorph new.
titulo contents: 'SISTEMA DE VETERINARIA'.
titulo position: 30@20.

self addMorph:  titulo. 
]

{ #category : #botones }
VentanaPrincipal >> asignarTratamiento [
	UIManager default inform: 'Asignar Tratamiento'.
]

{ #category : #botones }
VentanaPrincipal >> consultarFacturas [

	UIManager default inform: 'Facturas consultadas'
]

{ #category : #botones }
VentanaPrincipal >> consultarHistorial [

	UIManager default inform: 'Historial consultado'
]

{ #category : #botones }
VentanaPrincipal >> consultarRecaudacion [

	UIManager default inform: 'Recaudacion consultada'
]

{ #category : #botones }
VentanaPrincipal >> consultarTratamientos [

	UIManager default inform: 'Tratamientos consultados'
]

{ #category : #botones }
VentanaPrincipal >> facturarDiagnostico [

	UIManager default inform: 'Diagnostico facturado'
]

{ #category : #initialize }
VentanaPrincipal >> initialize [

	super initialize.
	self extent: 800 @ 600.
	self color: Color veryLightGray.
	
	self agregarTitulo.
	self agregarListaClientes .
	self agregarCantidadMascotas.
	self agregarBotones 
	
	

]

{ #category : #botones }
VentanaPrincipal >> registrarCliente [

	UIManager default inform: 'Cliente registrado'
]

{ #category : #botones }
VentanaPrincipal >> registrarDiagnostico [

	UIManager default inform: 'Diagnostico Registrado'
]

{ #category : #botones }
VentanaPrincipal >> registrarMascota [

	UIManager default inform: 'Mascota registrada'
]

{ #category : #botones }
VentanaPrincipal >> registrarPago [

	UIManager default inform: 'Pago registrado'
]
