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


	| exito |
	exito := unTurno verificarTurno: colTurnos.
	exito ifTrue: [ colTurnos add: unTurno ].
	^ exito
]

{ #category : #propio }
Veterinaria >> agregarAplicacion: unaAplicacion [
colAplicaciones add: unaAplicacion.
]

{ #category : #propio }
Veterinaria >> agregarCliente: unCliente [
 colCliente add: unCliente.
]

{ #category : #propio }
Veterinaria >> agregarDiagnostico: unDiagnostico [
	colDiagnostico add: unDiagnostico 
]

{ #category : #propio }
Veterinaria >> agregarFactura: unaFactura [
colFacturas add: unaFactura.

]

{ #category : #propio }
Veterinaria >> agregarMonodroga: unaMonodroga [
	colMonodrogas add: unaMonodroga 
]

{ #category : #propio }
Veterinaria >> agregarVeterinario: unVeterinario [
	colVeterinario add: unVeterinario.
]

{ #category : #visualizer }
Veterinaria >> aplicaciones [
^colAplicaciones 
]

{ #category : #visualizer }
Veterinaria >> buscarCliente: unaMascota [

	| unCliente |
	unCliente := colCliente detect: [ :cliente |
		             cliente buscarMascota: unaMascota ].

	^ unCliente
]

{ #category : #propio }
Veterinaria >> buscarClientePorDni: unDni [
 ^colCliente detect: [ :cliente| cliente nroDoc = unDni  ]ifNone: [ nil ]. 
]

{ #category : #visualizer }
Veterinaria >> clientes [
^colCliente 
]

{ #category : #visualizer }
Veterinaria >> diagnosticos [
^colDiagnostico 
]

{ #category : #propio }
Veterinaria >> diagnosticosDe: unaMascota [
 ^colDiagnostico select: [ :unDiagnostico| unDiagnostico getMascota = unaMascota  ]
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
Veterinaria >> facturasPendientesDe: unCliente [

	^ colFacturas  select: [ :factura |
		  factura cliente = unCliente and: [ factura estaPagada not ] ]
]

{ #category : #propio }
Veterinaria >> facturasSinPagar [
^colFacturas reject: [ :factura | factura estaPagada  ]
]

{ #category : #propio }
Veterinaria >> generarFactura: unDiagnostico [

	| existe cliente montoTotal unaFactura |
	existe := colFacturas anySatisfy: [ :factura |
		          unDiagnostico = factura getDiagnostico ].
	existe ifTrue: [ ^ nil ].
	cliente := self buscarCliente: unDiagnostico getMascota.
	montoTotal := unDiagnostico calcularCosto.
	unaFactura := Factura
		              crearCliente: cliente
		              cuit: cuit
		              diagnostico: unDiagnostico
		              montoTotal: montoTotal
		              fechaGen: Date today
		              estadoPagado: false.
	colFacturas add: unaFactura.
	^unaFactura 
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

{ #category : #visualizer }
Veterinaria >> monodrogas [
^colMonodrogas 
]

{ #category : #propio }
Veterinaria >> recaudacionDesde: fechaDesde hasta: fechaHasta [
    | total |
    total := 0.

    colFacturas do: [ :factura |
        factura pagos do: [ :pago |
            (pago fechaPago >= fechaDesde and: [
                pago fechaPago <= fechaHasta
            ]) ifTrue: [
                total := total + pago montoPago
            ]
        ]
    ].

    ^ total
]

{ #category : #propio }
Veterinaria >> recaudacionTotal [
    | total |
    total := 0.

    colFacturas do: [ :factura |
        total := total + factura montoAcumulado
    ].

    ^ total

]

{ #category : #propio }
Veterinaria >> tratamientosDe: unVeterinario [ 
    | diagnosticosDelVeterinario |

    diagnosticosDelVeterinario := colDiagnostico select: [ :diagnostico |
        diagnostico medico = unVeterinario
    ].

    ^ diagnosticosDelVeterinario flatCollect: [ :diagnostico |
        diagnostico tratamientos
    ]

]

{ #category : #propio }
Veterinaria >> tratamientosPendientesDe: unaMascota [
    ^ (self diagnosticosDe: unaMascota)
        flatCollect: [ :unDiagnostico |
            unDiagnostico tratamientos select: [ :unTratamiento |
                unTratamiento estado = 'Pendiente'
            ]
        ]
]

{ #category : #visualizer }
Veterinaria >> turnos [ 
^colTurnos 
]

{ #category : #visualizer }
Veterinaria >> turnosCanceladosDe: unCliente [
^(self turnosDe: unCliente ) select: [ :unTurno | unTurno estado = 'Cancelado' ].
]

{ #category : #visualizer }
Veterinaria >> turnosDe: unCliente [
    ^ colTurnos select: [ :unTurno |
        unTurno cliente = unCliente
    ]
]

{ #category : #visualizer }
Veterinaria >> veterinarios [
	^colVeterinario 
]
