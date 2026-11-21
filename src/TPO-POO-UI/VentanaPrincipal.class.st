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

{ #category : #actualizadores }
VentanaPrincipal >> actualizarCantidadMascotas [

	| cantidad |
	cantidad := modelo clientes
		            inject: 0
		            into: [ :total :cliente | total + cliente mascotas size ].
	textoCantidad contents: cantidad asString.
]

{ #category : #actualizadores }
VentanaPrincipal >> actualizarListaClientes [

	| texto |
	texto := String streamContents: [ :stream |
		         modelo clientes do: [ :cliente |
			         stream
				         nextPutAll: cliente nombre;
				         space;
				         nextPutAll: cliente apellido;
				         cr ] ].
	listaClientes contents: texto.
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
		agregarBoton: 'Cerrar'
		accion: #cerrarVentana
		posicion: 600 @ 550.
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
		accion: #consultarHistorialClinico 
		posicion: 30 @ 300.
	self
		agregarBoton: 'Trats. por veterinario'
		accion: #consultarTratamientosVeterinario
		posicion: 230 @ 300.

	self
		agregarBoton: 'Facturas Pendientes'
		accion: #consultarFacturas
		posicion: 430 @ 300.
	self
		agregarBoton: 'Consultar recaudacion'
		accion: #consultarRecaudacion
		posicion: 30 @ 350.
	self
		agregarBoton: 'Solicitar Turno'
		accion: #solicitarTurno
		posicion: 30 @ 400.
	self
		agregarBoton: 'Cancelar Turno'
		accion: #cancelarTurno
		posicion: 230 @ 400.
	self
		agregarBoton: 'Consultar turnos'
		accion: #consultarTurnos
		posicion: 430 @ 400.
	self
		agregarBoton: 'Registrar atencion'
		accion: #registrarAtencion
		posicion: 30 @ 450.
	self
		agregarBoton: 'Recaudacion entre fechas'
		accion: #consultarRecaudacionEntreFechas
		posicion: 230 @ 350.
	self
		agregarBoton: 'Historial turnos cliente'
		accion: #consultarHistorialTurnosCliente
		posicion: 430 @ 350.
	self
		agregarBoton: 'Turnos cancelados'
		accion: #consultarTurnosCanceladosCliente
		posicion: 430 @ 450
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

	| diagnosticoTexto numero diagnostico tipo fechaTexto fecha motivo estado tratamiento nombreMono monodroga dosisTexto frecuencia partes |
	modelo diagnosticos isEmpty ifTrue: [
		UIManager default inform: 'No hay diagnosticos registrados'.
		^ self ].

	diagnosticoTexto := String streamContents: [ :stream |
		                    modelo diagnosticos withIndexDo: [
			                    :unDiagnostico
			                    :indice |
			                    stream
				                    nextPutAll: indice asString;
				                    nextPutAll: ' - ';
				                    nextPutAll: unDiagnostico descripcion;
				                    cr ] ].

	UIManager default inform: diagnosticoTexto.

	numero := UIManager default request: 'Numero del diagnostico'.
	numero ifNil: [ ^ self ].

	numero := numero asNumber.

	(numero isInteger and: [
		 numero >= 1 and: [ numero <= modelo diagnosticos size ] ])
		ifFalse: [
			UIManager default inform: 'Numero invalido'.
			^ self ].

	diagnostico := modelo diagnosticos at: numero.

	tipo := UIManager default
		        chooseFrom: #( 'Farmacologico' 'Quirurgico' )
		        values: #( 'Farmacologico' 'Quirurgico' )
		        title: 'Seleccione el tipo de tratamiento'.

	tipo ifNil: [ ^ self ].

	fechaTexto := UIManager default request: 'Fecha (DD/MM/AAA)'.
	fechaTexto ifNil: [ ^ self ].
	partes := fechaTexto substrings: '/'.
	fecha := Date
		         year: (partes at: 3) asNumber
		         month: (partes at: 2) asNumber
		         day: (partes at: 1) asNumber.

	motivo := UIManager default request: 'Motivo del tratamiento'.
	motivo ifNil: [ ^ self ].

	estado := 'Pendiente'.

	tipo = 'Farmacologico'
		ifTrue: [
			nombreMono := UIManager default request: 'Nombre de la monodroga'.
			nombreMono ifNil: [ ^ self ].

			monodroga := modelo monodrogas
				             detect: [ :unaMono |
				             unaMono nombreMono asLowercase
				             = nombreMono asLowercase ]
				             ifNone: [ nil ].

			monodroga ifNil: [
				UIManager default inform: 'No existe esa monodroga'.
				^ self ].

			monodroga tieneStock ifFalse: [
				UIManager default inform: 'No hay stock suficiente'.
				^ self ].

			dosisTexto := UIManager default request: 'Ingrese la dosis'.
			dosisTexto ifNil: [ ^ self ].

			frecuencia := UIManager default request: 'Ingrese la frecuencia'.
			frecuencia ifNil: [ ^ self ].

			tratamiento := Farmacologico
				               crearFecha: fecha
				               motivo: motivo
				               estado: estado
				               monodroga: monodroga
				               dosis: dosisTexto asNumber
				               frecuencia: frecuencia ]
		ifFalse: [
			tratamiento := self
				               crearTratamientoQuirurgicoConFecha: fecha
				               motivo: motivo
				               estado: estado.
			tratamiento ifNil: [ ^ self ] ].

	(diagnostico agregarTratamiento: tratamiento)
		ifTrue: [
			UIManager default inform:
				'Tratamiento asignado correctamente. Costo total del diagnostico: $'
				, diagnostico calcularCosto asString ]
		ifFalse: [ 	UIManager default inform:
		'Tratamiento no es valido para la fecha o las condiciones indicadas' ]
]

{ #category : #botones }
VentanaPrincipal >> cancelarTurno [
    | texto numeroTexto numero turno |

    modelo turnos isEmpty ifTrue: [
        UIManager default inform: 'No hay turnos registrados'.
        ^ self
    ].

    texto := String streamContents: [ :stream |
        modelo turnos withIndexDo: [ :unTurno :indice |
            stream
                nextPutAll: indice asString;
                nextPutAll: ' - Fecha: ';
                nextPutAll: unTurno fecha asString;
                nextPutAll: ' - Hora: ';
                nextPutAll: unTurno hora asString;
                nextPutAll: ' - Estado: ';
                nextPutAll: unTurno estado;
                cr
        ]
    ].

    UIManager default inform: texto.

    numeroTexto := UIManager default request:
        'Ingrese el numero del turno que desea cancelar'.

    numeroTexto ifNil: [ ^ self ].

    numero := numeroTexto asNumber.

    (numero isInteger and: [
        numero >= 1 and: [ numero <= modelo turnos size ]
    ]) ifFalse: [
        UIManager default inform: 'Numero de turno invalido'.
        ^ self
    ].

    turno := modelo turnos at: numero.

    turno estado: 'Cancelado'.

    UIManager default inform: 'Turno cancelado correctamente'.
]

{ #category : #test }
VentanaPrincipal >> cargarClientesPrueba [
    | cliente1 cliente2 cliente3
      mascota11 mascota21 mascota22 mascota31 |

    "CLIENTE 1"
    cliente1 := Cliente
        crearNroDni: '35111222'
        nombre: 'Carlos'
        apellido: 'Rodriguez'
        domicilio: 'San Martin 150'
        email: 'carlos@mail.com'
        telefono: '2994001001'.

    mascota11 := Mascota
        crearNombre: 'Firulais'
        especie: 'Perro'
        raza: 'Labrador'
        fechaNac: (Date year: 2020 month: 3 day: 15)
        peso: 25.

    cliente1 agregarMascota: mascota11.


    "CLIENTE 2"
    cliente2 := Cliente
        crearNroDni: '32444555'
        nombre: 'Laura'
        apellido: 'Gomez'
        domicilio: 'Belgrano 250'
        email: 'laura@mail.com'
        telefono: '2994001002'.

    mascota21 := Mascota
        crearNombre: 'Michi'
        especie: 'Gato'
        raza: 'Siames'
        fechaNac: (Date year: 2022 month: 6 day: 10)
        peso: 5.

    mascota22 := Mascota
        crearNombre: 'Rocky'
        especie: 'Perro'
        raza: 'Ovejero'
        fechaNac: (Date year: 2019 month: 8 day: 20)
        peso: 30.

    cliente2 agregarMascota: mascota21.
    cliente2 agregarMascota: mascota22.


    "CLIENTE 3"
    cliente3 := Cliente
        crearNroDni: '29888777'
        nombre: 'Mariana'
        apellido: 'Lopez'
        domicilio: 'Mitre 350'
        email: 'mariana@mail.com'
        telefono: '2994001003'.

    mascota31 := Mascota
        crearNombre: 'Luna'
        especie: 'Perro'
        raza: 'Caniche'
        fechaNac: (Date year: 2021 month: 11 day: 5)
        peso: 8.

    cliente3 agregarMascota: mascota31.


    "AGREGAR CLIENTES AL MODELO"
    modelo agregarCliente: cliente1.
    modelo agregarCliente: cliente2.
    modelo agregarCliente: cliente3.

]

{ #category : #test }
VentanaPrincipal >> cargarDiagnosticosPrueba [
    | cliente2 cliente3 mascota22 mascota31 vet1 vet2
      amoxicilina paracetamol
      diagnosticoRocky diagnosticoLuna1 diagnosticoLuna2
      farm1 farm2 farm3 quir1 quir2 |

    cliente2 := modelo buscarClientePorDni: '32444555'.
    cliente3 := modelo buscarClientePorDni: '29888777'.

    mascota22 := cliente2 mascotas at: 2.
    mascota31 := cliente3 mascotas at: 1.

    vet1 := modelo veterinarios at: 1.
    vet2 := modelo veterinarios at: 2.

    amoxicilina := modelo monodrogas
        detect: [ :m | m nombreMono = 'Amoxicilina' ].

    paracetamol := modelo monodrogas
        detect: [ :m | m nombreMono = 'Paracetamol' ].

    "DIAGNOSTICO 1: ROCKY"
    diagnosticoRocky := Diagnostico
        crearFecha: (Date year: 2026 month: 3 day: 2)
        descripcion: 'Infeccion y necesidad de intervencion'
        medico: vet1
        mascota: mascota22.

    farm1 := Farmacologico
        crearFecha: (Date year: 2026 month: 3 day: 3)
        motivo: 'Tratamiento de infeccion'
        estado: 'Pendiente'
        monodroga: amoxicilina
        dosis: 2
        frecuencia: 'Cada 8 horas'.

    quir1 := Quirurgico
        crearFecha: (Date year: 2026 month: 3 day: 4)
        motivo: 'Intervencion quirurgica'
        estado: 'Pendiente'
        nombre: 'Cirugia'
        nivelRiesgo: 1
        tipoAnestesia: 'Local'.

    diagnosticoRocky agregarTratamiento: farm1.
    diagnosticoRocky agregarTratamiento: quir1.
"DIAGNOSTICO 2: LUNA"
    diagnosticoLuna1 := Diagnostico
        crearFecha: (Date year: 2026 month: 3 day: 5)
        descripcion: 'Intervencion quirurgica'
        medico: vet2
        mascota: mascota31.

    quir2 := Quirurgico
        crearFecha: (Date year: 2026 month: 3 day: 6)
        motivo: 'Cirugia'
        estado: 'Pendiente'
        nombre: 'Cirugia correctiva'
        nivelRiesgo: 2
        tipoAnestesia: 'General'.

    diagnosticoLuna1 agregarTratamiento: quir2.

    "DIAGNOSTICO 3: LUNA"
    diagnosticoLuna2 := Diagnostico
        crearFecha: (Date year: 2026 month: 3 day: 9)
        descripcion: 'Tratamiento farmacologico'
        medico: vet1
        mascota: mascota31.

    farm2 := Farmacologico
        crearFecha: (Date year: 2026 month: 3 day: 10)
        motivo: 'Tratamiento analgesico'
        estado: 'Pendiente'
        monodroga: paracetamol
        dosis: 2
        frecuencia: 'Cada 12 horas'.

    farm3 := Farmacologico
        crearFecha: (Date year: 2026 month: 3 day: 11)
        motivo: 'Tratamiento complementario'
        estado: 'Pendiente'
        monodroga: amoxicilina
        dosis: 1
        frecuencia: 'Cada 8 horas'.

    diagnosticoLuna2 agregarTratamiento: farm2.
    diagnosticoLuna2 agregarTratamiento: farm3.

    modelo agregarDiagnostico: diagnosticoRocky.
    modelo agregarDiagnostico: diagnosticoLuna1.
    modelo agregarDiagnostico: diagnosticoLuna2.

]

{ #category : #initialize }
VentanaPrincipal >> cargarMonodrogasPrueba [
    | monodroga1 monodroga2 |

    monodroga1 := Monodroga
        crearNombre: 'Amoxicilina'
        valorMono: 2500
        ventaLibre: false
        stock: 20.

    monodroga2 := Monodroga
        crearNombre: 'Paracetamol'
        valorMono: 1500
        ventaLibre: true
        stock: 15.

    modelo agregarMonodroga: monodroga1.
    modelo agregarMonodroga: monodroga2.
]

{ #category : #test }
VentanaPrincipal >> cargarVacunasPrueba [

	| vacunaPerro vacunaGato vet1 vet2 cliente2 cliente3 mascota21 mascota22 mascota31 |
	vet1 := modelo veterinarios at: 1.
	vet2 := modelo veterinarios at: 2.

	cliente2 := modelo buscarClientePorDni: '32444555'.
	cliente3 := modelo buscarClientePorDni: '29888777'.

	mascota21 := cliente2 mascotas at: 1.
	mascota22 := cliente2 mascotas at: 2.
	mascota31 := cliente3 mascotas at: 1.

	vacunaPerro := Vacuna
		               crearNombreVac: 'Antirrabica'
		               laboratorio: 'LabVet'
		               especie: 'Perro'
		               vigencia: 365.

	vacunaGato := Vacuna
		              crearNombreVac: 'Triple Felina'
		              laboratorio: 'VetLab'
		              especie: 'Gato'
		              vigencia: 365.

	mascota21 agregarAplicacion: (Aplicacion
			 crearFecha: (Date year: 2026 month: 1 day: 10)
			 veterinario: vet1
			 vacuna: vacunaGato).

	mascota22 agregarAplicacion: (Aplicacion
			 crearFecha: (Date year: 2026 month: 2 day: 5)
			 veterinario: vet2
			 vacuna: vacunaPerro).

		mascota31 agregarAplicacion: (Aplicacion
			 crearFecha: (Date year: 2024 month: 3 day: 5)
			 veterinario: vet1
			 vacuna: vacunaPerro)
]

{ #category : #initialize }
VentanaPrincipal >> cargarVeterinariosPrueba [
   | veterinario1 veterinario2 |

    veterinario1 := Veterinario
        crearNroDni: '30111222'
        nombre: 'Juan'
        apellido: 'Perez'
        domicilio: 'San Martin 123'
        fechaNac: (Date year: 1985 month: 5 day: 12)
        CUIL: '20-30111222-3'.

    veterinario2 := Veterinario
        crearNroDni: '28444555'
        nombre: 'Maria'
        apellido: 'Gomez'
        domicilio: 'Belgrano 456'
        fechaNac: (Date year: 1990 month: 8 day: 20)
        CUIL: '27-28444555-4'.

    modelo agregarVeterinario: veterinario1.
    modelo agregarVeterinario: veterinario2. 
]

{ #category : #botones }
VentanaPrincipal >> cerrarVentana [
 self delete.
]

{ #category : #consultas }
VentanaPrincipal >> consultarFacturas [ 
    | clientes texto numero cliente pendientes |

    clientes := modelo clientes.

    texto := String streamContents: [ :stream |
        clientes withIndexDo: [ :unCliente :indice |
            stream
                nextPutAll: indice asString;
                nextPutAll: ' - ';
                nextPutAll: unCliente nombre asString;
                cr
        ]
    ].

    UIManager default inform: texto.

    numero := UIManager default request: 'Numero del cliente'.
    numero ifNil: [ ^ self ].
    numero := numero asNumber.

    (numero isInteger and: [
        numero >= 1 and: [ numero <= clientes size ]
    ]) ifFalse: [
        UIManager default inform: 'Numero invalido'.
        ^ self
    ].

    cliente := clientes at: numero.
    pendientes := modelo facturasPendientesDe: cliente.

    pendientes isEmpty ifTrue: [
        UIManager default inform: 'El cliente no tiene facturas pendientes'.
        ^ self
    ].

    texto := String streamContents: [ :stream |
        pendientes do: [ :factura |
            stream
                nextPutAll: 'Diagnostico: ';
                nextPutAll: factura getDiagnostico descripcion;
                nextPutAll: ' - Saldo pendiente: $';
                nextPutAll: factura pagoPendiente asString;
                cr
        ]
    ].

    UIManager default inform: texto


]

{ #category : #consultas }
VentanaPrincipal >> consultarHistorial [

	UIManager default inform: 'Historial consultado'
]

{ #category : #consultas }
VentanaPrincipal >> consultarHistorialClinico [

    | dni cliente texto |

    dni := UIManager default request: 'Ingrese el DNI del cliente'.
    dni ifNil: [ ^ self ].

    cliente := modelo buscarClientePorDni: dni.

    cliente ifNil: [
        UIManager default inform: 'No existe ese cliente'.
        ^ self
    ].

    texto := String streamContents: [ :stream |
        cliente mascotas do: [ :unaMascota |
            stream
                nextPutAll: 'MASCOTA: ';
                nextPutAll: unaMascota nombreMascota;
                cr;
                nextPutAll: 'Historial clinico';
                cr.

            (modelo historialClinicoDe: unaMascota) first do: [ :unDiagnostico |
                stream
                    nextPutAll: 'Diagnostico: ';
                    nextPutAll: unDiagnostico descripcion;
                    cr.
                unDiagnostico tratamientos do: [ :unTratamiento |
                    stream
                        nextPutAll: '  Tratamiento: ';
                        nextPutAll: unTratamiento motivo;
                        cr
                ]
            ].

            (modelo historialClinicoDe: unaMascota) second do: [ :unaAplicacion |
                stream
                    nextPutAll: 'Vacuna: ';
                    nextPutAll: unaAplicacion vacuna nombreVacuna;
                    cr
            ].
            stream cr
        ]
    ].

    UIManager default inform: texto.
]

{ #category : #consultas }
VentanaPrincipal >> consultarHistorialTurnosCliente [
    | clientes texto numero cliente turnos |
    clientes := modelo clientes.

    texto := String streamContents: [ :stream |
        clientes withIndexDo: [ :unCliente :indice |
            stream
                nextPutAll: indice asString;
                nextPutAll: ' - ';
                nextPutAll: unCliente nombre asString;
                cr
        ]
    ].

    UIManager default inform: texto.

    numero := UIManager default request: 'Numero del cliente'.
    numero ifNil: [ ^ self ].
    numero := numero asNumber.

    (numero isInteger and: [
        numero >= 1 and: [ numero <= clientes size ]
    ]) ifFalse: [
        UIManager default inform: 'Numero invalido'.
        ^ self
    ].

    cliente := clientes at: numero.
    turnos := modelo turnosDe: cliente.

    turnos isEmpty ifTrue: [
        UIManager default inform: 'El cliente no tiene turnos registrados'.
        ^ self
    ].

    texto := String streamContents: [ :stream |
        turnos do: [ :unTurno |
            stream
                nextPutAll: 'Fecha: ';
                nextPutAll: unTurno fecha asString;
                nextPutAll: ' - Hora: ';
                nextPutAll: unTurno hora asString;
                nextPutAll: ' - Estado: ';
                nextPutAll: unTurno estado;
                nextPutAll: ' - Motivo: ';
                nextPutAll: unTurno motivo;
                cr
        ]
    ].

    UIManager default inform: texto

]

{ #category : #botones }
VentanaPrincipal >> consultarRecaudacion [ 
    | total |

    total := modelo recaudacionTotal.

    UIManager default inform:
        'Recaudacion total: $', total asString
]

{ #category : #botones }
VentanaPrincipal >> consultarRecaudacionEntreFechas [

	| desde hasta total |
	desde := UIManager default request: 'Fecha desde (dd/mm/aaaa)'.
	desde ifNil: [ ^ self ].

	hasta := UIManager default request: 'Fecha hasta (dd/mm/aaaa)'.
	hasta ifNil: [ ^ self ].

	desde := Date
    year: (desde copyFrom: 7 to: 10) asNumber
    month: (desde copyFrom: 4 to: 5) asNumber
    day: (desde copyFrom: 1 to: 2) asNumber.

hasta := Date
    year: (hasta copyFrom: 7 to: 10) asNumber
    month: (hasta copyFrom: 4 to: 5) asNumber
    day: (hasta copyFrom: 1 to: 2) asNumber.
	desde > hasta ifTrue: [
		UIManager default inform:
			'La fecha inicial no puede ser posterior a la final'.
		^ self ].

	total := modelo recaudacionDesde: desde hasta: hasta.

	UIManager default inform:
		'Recaudacion entre las fechas indicadas: $' , total asString
]

{ #category : #botones }
VentanaPrincipal >> consultarTratamientos [

	UIManager default inform: 'Tratamientos consultados'
]

{ #category : #botones }
VentanaPrincipal >> consultarTratamientosVeterinario [ 
    | texto numero veterinario tratamientos |

    texto := String streamContents: [ :stream |
        modelo veterinarios withIndexDo: [ :vet :indice |
            stream
                nextPutAll: indice asString;
                nextPutAll: ' - ';
                nextPutAll: vet nombre asString;
                cr
        ]
    ].

    UIManager default inform: texto.

    numero := UIManager default request: 'Numero del veterinario'.
    numero ifNil: [ ^ self ].
    numero := numero asNumber.

    (numero isInteger and: [
        numero >= 1 and: [ numero <= modelo veterinarios size ]
    ]) ifFalse: [
        UIManager default inform: 'Numero invalido'.
        ^ self
    ].

    veterinario := modelo veterinarios at: numero.
    tratamientos := modelo tratamientosDe: veterinario.

    tratamientos isEmpty ifTrue: [
        UIManager default inform: 'Este veterinario no tiene tratamientos registrados'.
        ^ self
    ].

    texto := String streamContents: [ :stream |
        tratamientos do: [ :tratamiento |
            stream
                nextPutAll: tratamiento motivo asString;
                cr
        ]
    ].

    UIManager default inform: texto

]

{ #category : #botones }
VentanaPrincipal >> consultarTurnos [
    | texto |

    modelo turnos isEmpty ifTrue: [
        UIManager default inform: 'No hay turnos registrados'.
        ^ self
    ].

    texto := String streamContents: [ :stream |
        modelo turnos do: [ :unTurno |

            stream
                nextPutAll: 'Cliente: ';
                nextPutAll: unTurno cliente nombre;
                space;
                nextPutAll: unTurno cliente apellido;
                cr;

                nextPutAll: 'Mascota: ';
                nextPutAll: unTurno mascota nombreMascota;
                cr;

                nextPutAll: 'Veterinario: ';
                nextPutAll: unTurno veterinario nombre;
                space;
                nextPutAll: unTurno veterinario apellido;
                cr;

                nextPutAll: 'Fecha: ';
                nextPutAll: unTurno fecha asString;
                cr;

                nextPutAll: 'Hora: ';
                nextPutAll: unTurno hora asString;
                cr;

                nextPutAll: 'Motivo: ';
                nextPutAll: unTurno motivo;
                cr;

                nextPutAll: 'Estado: ';
                nextPutAll: unTurno estado;
                cr;
                nextPutAll: '-----------------------------';
                cr
        ]
    ].

    UIManager default inform: texto.
]

{ #category : #consultas }
VentanaPrincipal >> consultarTurnosCanceladosCliente [
    | clientes texto numero cliente turnos |
    clientes := modelo clientes.

    texto := String streamContents: [ :stream |
        clientes withIndexDo: [ :unCliente :indice |
            stream
                nextPutAll: indice asString;
                nextPutAll: ' - ';
                nextPutAll: unCliente nombre asString;
                cr
        ]
    ].

    UIManager default inform: texto.

    numero := UIManager default request: 'Numero del cliente'.
    numero ifNil: [ ^ self ].
    numero := numero asNumber.

    (numero isInteger and: [
        numero >= 1 and: [ numero <= clientes size ]
    ]) ifFalse: [
        UIManager default inform: 'Numero invalido'.
        ^ self
    ].

    cliente := clientes at: numero.
    turnos := modelo turnosCanceladosDe: cliente.

    turnos isEmpty ifTrue: [
        UIManager default inform: 'El cliente no tiene turnos cancelados'.
        ^ self
    ].

    texto := String streamContents: [ :stream |
        turnos do: [ :unTurno |
            stream
                nextPutAll: 'Fecha: ';
                nextPutAll: unTurno fecha asString;
                nextPutAll: ' - Hora: ';
                nextPutAll: unTurno hora asString;
                nextPutAll: ' - Motivo: ';
                nextPutAll: unTurno motivo;
                cr
        ]
    ].

    UIManager default inform: texto
]

{ #category : #aux }
VentanaPrincipal >> crearTratamientoQuirurgicoConFecha: fecha motivo: motivo estado: estado [
    | nombre nivelTexto nivel anestesia |

    nombre := UIManager default request: 'Nombre del procedimiento'.
    nombre ifNil: [ ^ nil ].

    nivelTexto := UIManager default request: 'Nivel de riesgo (1 o 2)'.
    nivelTexto ifNil: [ ^ nil ].

    nivel := nivelTexto asNumber.

    (nivel = 1 or: [ nivel = 2 ]) ifFalse: [
        UIManager default inform: 'Nivel de riesgo invalido'.
        ^ nil
    ].

    anestesia := UIManager default
        chooseFrom: #('General' 'Regional' 'Local')
        values: #('General' 'Regional' 'Local')
        title: 'Tipo de anestesia'.

    anestesia ifNil: [ ^ nil ].

    ^ Quirurgico
        crearFecha: fecha
        motivo: motivo
        estado: estado
        nombre: nombre
        nivelRiesgo: nivel
        tipoAnestesia: anestesia.
]

{ #category : #botones }
VentanaPrincipal >> facturarDiagnostico [
    | texto numero diagnostico factura |

    modelo diagnosticos isEmpty ifTrue: [
        UIManager default inform: 'No hay diagnosticos registrados'.
        ^ self
    ].

    texto := String streamContents: [ :stream |
        modelo diagnosticos withIndexDo: [ :unDiagnostico :indice |
            stream
                nextPutAll: indice asString;
                nextPutAll: ' - ';
                nextPutAll: unDiagnostico descripcion;
                cr
        ]
    ].

    UIManager default inform: texto.

    numero := UIManager default request: 'Numero del diagnostico'.
    numero ifNil: [ ^ self ].

    numero := numero asNumber.

    (numero isInteger and: [
        numero >= 1 and: [ numero <= modelo diagnosticos size ]
    ]) ifFalse: [
        UIManager default inform: 'Numero invalido'.
        ^ self
    ].

    diagnostico := modelo diagnosticos at: numero.

    factura := modelo generarFactura: diagnostico.

    factura ifNil: [
        UIManager default inform: 'Este diagnostico ya tiene una factura'.
        ^ self
    ].

    UIManager default inform:
        'Factura generada correctamente. Importe: $',
        factura montoTotal asString
]

{ #category : #initialize }
VentanaPrincipal >> initialize [

	super initialize.

	modelo := Veterinaria crearCuit: '20-0000000-0'.
	Quirurgico iniciarTabla.
	self cargarVeterinariosPrueba.
	self cargarMonodrogasPrueba.
	self cargarClientesPrueba.
	self cargarVacunasPrueba.
	UIManager default inform: 'Mascotas con vacunas vencidas: ', (modelo mascotasConVacunasVencidas size)asString .
	self cargarDiagnosticosPrueba.
	self extent: 800 @ 600.
	self color: Color veryLightGray.

	self agregarTitulo.
	self agregarListaClientes.
	self agregarCantidadMascotas.
	self agregarBotones.

	self actualizarListaClientes.
	self actualizarCantidadMascotas
]

{ #category : #test }
VentanaPrincipal >> modelo [ 
^modelo
]

{ #category : #botones }
VentanaPrincipal >> registrarAtencion [
    | texto numeroTexto numero turno presencia |

    modelo turnos isEmpty ifTrue: [
        UIManager default inform: 'No hay turnos registrados'.
        ^ self
    ].

    texto := String streamContents: [ :stream |
        modelo turnos withIndexDo: [ :unTurno :indice |
            stream
                nextPutAll: indice asString;
                nextPutAll: ' - Fecha: ';
                nextPutAll: unTurno fecha asString;
                nextPutAll: ' - Hora: ';
                nextPutAll: unTurno hora asString;
                nextPutAll: ' - Estado: ';
                nextPutAll: unTurno estado;
                cr
        ]
    ].

    UIManager default inform: texto.

    numeroTexto := UIManager default request:
        'Ingrese el numero del turno'.

    numeroTexto ifNil: [ ^ self ].
    numero := numeroTexto asNumber.

    (numero isInteger and: [
        numero >= 1 and: [ numero <= modelo turnos size ]
    ]) ifFalse: [
        UIManager default inform: 'Numero de turno invalido'.
        ^ self
    ].

    turno := modelo turnos at: numero.

    turno estado = 'Cancelado' ifTrue: [
        UIManager default inform: 'No se puede atender un turno cancelado'.
        ^ self
    ].

    turno estado = 'Atendido' ifTrue: [
        UIManager default inform: 'Este turno ya fue atendido'.
        ^ self
    ].

    presencia := UIManager default
        chooseFrom: #('Presente' 'Ausente')
        values: #('Presente' 'Ausente')
        title: '¿El cliente está presente?'.

    presencia ifNil: [ ^ self ].

    presencia = 'Ausente'
        ifTrue: [
            turno estado: 'Ausente'.
            UIManager default inform: 'Turno registrado como ausente'.
            ^ self
        ].

    turno estado: 'Atendido'.

    (turno isKindOf: TurnoTratamiento) ifTrue: [
        turno tratamiento estado: 'Realizado'
    ].

    UIManager default inform: 'Atencion registrada correctamente'.


]

{ #category : #botones }
VentanaPrincipal >> registrarCliente [

	| dni nombre apellido domicilio email telefono nuevoCliente |
	dni := UIManager default request: 'Ingrese el DNI'.
	dni ifNil: [ ^ self ].

	nombre := UIManager default request: 'Ingrese el nombre'.
	nombre ifNil: [ ^ self ].

	apellido := UIManager default request: 'Ingrese el apellido'.
	apellido ifNil: [ ^ self ].

	domicilio := UIManager default request: 'Ingrese el domicilio'.
	domicilio ifNil: [ ^ self ].

	email := UIManager default request: 'Ingrese el email'.
	email ifNil: [ ^ self ].

	telefono := UIManager default request: 'Ingrese el telefono'.
	telefono ifNil: [ ^ self ].

	nuevoCliente := Cliente
		                crearNroDni: dni
		                nombre: nombre
		                apellido: apellido
		                domicilio: domicilio
		                email: email
		                telefono: telefono.
	modelo agregarCliente: nuevoCliente.
	self actualizarListaClientes.
	UIManager default inform: 'Cliente registrado correctamente'
]

{ #category : #botones }
VentanaPrincipal >> registrarDiagnostico [

	| dniCliente cliente nombreMascota mascota dniVeterinario veterinario fechaTexto fecha descripcion nuevoDiagnostico partes |
	dniCliente := UIManager default request: 'DNI del cliente'.
	dniCliente ifNil: [ ^ self ].

	cliente := modelo buscarClientePorDni: dniCliente.

	cliente ifNil: [
		UIManager default inform: 'No existe ese cliente'.
		^ self ].

	nombreMascota := UIManager default request: 'Nombre de la mascota'.
	nombreMascota ifNil: [ ^ self ].

	mascota := cliente mascotas
		           detect: [ :unaMascota |
		           unaMascota nombreMascota = nombreMascota ]
		           ifNone: [ nil ].

	mascota ifNil: [
		UIManager default inform: 'No existe esa mascota para el cliente'.
		^ self ].

	dniVeterinario := UIManager default request: 'DNI del veterinario'.
	dniVeterinario ifNil: [ ^ self ].

	veterinario := modelo veterinarios
		               detect: [ :unVeterinario |
		               unVeterinario nroDoc = dniVeterinario ]
		               ifNone: [ nil ].

	veterinario ifNil: [
		UIManager default inform: 'No existe ese veterinario'.
		^ self ].

	fechaTexto := UIManager default request: 'Fecha (DD/MM/AAA)'.
	fechaTexto ifNil: [ ^ self ].
	partes := fechaTexto substrings: '/'.
	fecha := Date
		         year: (partes at: 3) asNumber
		         month: (partes at: 2) asNumber
		         day: (partes at: 1) asNumber.	descripcion := UIManager default request:
		               'Descripcion del diagnostico'.
	descripcion ifNil: [ ^ self ].

	nuevoDiagnostico := Diagnostico
		                    crearFecha: fecha
		                    descripcion: descripcion
		                    medico: veterinario
		                    mascota: mascota.

	modelo agregarDiagnostico: nuevoDiagnostico.

	UIManager default inform: 'Diagnostico registrado correctamente'
]

{ #category : #botones }
VentanaPrincipal >> registrarMascota [

	| dni cliente nombre especie raza fechaTexto pesoTexto fecha peso nuevaMascota |
	dni := UIManager default request: 'Ingrese el DNI del cliente'.
	dni ifNil: [ ^ self ].

	cliente := modelo buscarClientePorDni: dni.

	cliente ifNil: [
		UIManager default inform: 'No existe un cliente con ese DNI'.
		^ self ].

	nombre := UIManager default request:
		          'Ingrese el nombre de la mascota'.
	nombre ifNil: [ ^ self ].

	especie := UIManager default request: 'Ingrese la especie'.
	especie ifNil: [ ^ self ].

	raza := UIManager default request: 'Ingrese la raza'.
	raza ifNil: [ ^ self ].

	fechaTexto := UIManager default request:
		              'Fecha de nacimiento (DD/MM/AAA)'.
	fechaTexto ifNil: [ ^ self ].

	pesoTexto := UIManager default request: 'Ingrese el peso'.
	pesoTexto ifNil: [ ^ self ].

	fecha := Date readFrom: fechaTexto readStream.
	peso := Number readFrom: pesoTexto readStream.

	nuevaMascota := Mascota
		                crearNombre: nombre
		                especie: especie
		                raza: raza
		                fechaNac: fecha
		                peso: peso.
	cliente agregarMascota: nuevaMascota.
	self actualizarCantidadMascotas.
	UIManager default inform: 'Mascota registrada correctamente'
]

{ #category : #botones }
VentanaPrincipal >> registrarPago [ 
    | facturas texto numero factura monto medio pago |

    facturas := modelo facturasSinPagar.

    facturas isEmpty ifTrue: [
        UIManager default inform: 'No hay facturas pendientes'.
        ^ self
    ].

    texto := String streamContents: [ :stream |
        facturas withIndexDo: [ :unaFactura :indice |
            stream
                nextPutAll: indice asString;
                nextPutAll: ' - ';
                nextPutAll: unaFactura cliente asString;
                nextPutAll: ' - Pendiente: $';
                nextPutAll: unaFactura pagoPendiente asString;
                cr
        ]
    ].

    UIManager default inform: texto.

    numero := UIManager default request: 'Numero de factura'.
    numero ifNil: [ ^ self ].
    numero := numero asNumber.

    (numero isInteger and: [
        numero >= 1 and: [ numero <= facturas size ]
    ]) ifFalse: [
        UIManager default inform: 'Numero invalido'.
        ^ self
    ].

    factura := facturas at: numero.

    monto := UIManager default request: 'Ingrese el monto del pago'.
    monto ifNil: [ ^ self ].
    monto := monto asNumber.

    medio := UIManager default
        chooseFrom: #('Efectivo' 'Credito' 'Billetera')
        values: #('Efectivo' 'Credito' 'Billetera')
        title: 'Seleccione el medio de pago'.

    medio ifNil: [ ^ self ].

    pago := Pago crearFecha: Date today montoPago: monto.
    pago medioPago: medio.

    factura registrarPago: pago.

    UIManager default inform:
        (factura estaPagada
            ifTrue: [ 'Factura pagada completamente' ]
            ifFalse: [
                'Pago registrado. Saldo pendiente: $',
                factura pagoPendiente asString
            ])

]

{ #category : #botones }
VentanaPrincipal >> solicitarTurno [

	| dniCliente cliente nombreMascota mascota dniVeterinario veterinario fechaTexto fecha hora motivo tipo nuevoTurno exito tratamientos texto numero tratamiento partes |
	dniCliente := UIManager default request: 'DNI del cliente'.
	dniCliente ifNil: [ ^ self ].

	cliente := modelo buscarClientePorDni: dniCliente.
	cliente ifNil: [
		UIManager default inform: 'No existe ese cliente'.
		^ self ].

	nombreMascota := UIManager default request: 'Nombre de la mascota'.
	nombreMascota ifNil: [ ^ self ].

	mascota := cliente mascotas
		           detect: [ :unaMascota |
		           unaMascota nombreMascota = nombreMascota ]
		           ifNone: [ nil ].

	mascota ifNil: [
		UIManager default inform: 'El cliente no tiene esa mascota'.
		^ self ].

	tipo := UIManager default
		        chooseFrom: #( 'Consulta' 'Tratamiento' )
		        values: #( 'Consulta' 'Tratamiento' )
		        title: 'Tipo de turno'.

	tipo ifNil: [ ^ self ].

	dniVeterinario := UIManager default request: 'DNI del veterinario'.
	dniVeterinario ifNil: [ ^ self ].

	veterinario := modelo veterinarios
		               detect: [ :unVeterinario |
		               unVeterinario nroDoc = dniVeterinario ]
		               ifNone: [ nil ].

	veterinario ifNil: [
		UIManager default inform: 'No existe ese veterinario'.
		^ self ].

	fechaTexto := UIManager default request: 'Fecha (DD/MM/AAA)'.
	fechaTexto ifNil: [ ^ self ].
	partes := fechaTexto substrings: '/'.
	fecha := Date
		         year: (partes at: 3) asNumber
		         month: (partes at: 2) asNumber
		         day: (partes at: 1) asNumber.
	hora := UIManager default request: 'Hora'.
	hora ifNil: [ ^ self ].
	motivo := UIManager default request: 'Motivo del turno'.
	motivo ifNil: [ ^ self ].

	tipo = 'Consulta'
		ifTrue: [
			nuevoTurno := Turno
				              crearFecha: fecha
				              hora: hora
				              estado: 'Pendiente'
				              motivo: motivo
				              cliente: cliente
				              veterinario: veterinario
				              mascota: mascota ]
		ifFalse: [
			tratamientos := modelo tratamientosPendientesDe: mascota.

			tratamientos isEmpty ifTrue: [
				UIManager default inform:
					'La mascota no tiene tratamientos pendientes'.
				^ self ].

			texto := String streamContents: [ :stream |
				         tratamientos withIndexDo: [ :unTratamiento :indice |
					         stream
						         nextPutAll: indice asString;
						         nextPutAll: ' - ';
						         nextPutAll: unTratamiento motivo;
						         cr ] ].

			UIManager default inform: texto.

			numero := UIManager default request: 'Numero del tratamiento'.
			numero ifNil: [ ^ self ].
			numero := numero asNumber.

			(numero isInteger and: [
				 numero >= 1 and: [ numero <= tratamientos size ] ]) ifFalse: [
				UIManager default inform: 'Numero de tratamiento invalido'.
				^ self ].

			tratamiento := tratamientos at: numero.

			nuevoTurno := TurnoTratamiento
				              crearFecha: fecha
				              hora: hora
				              estado: 'Pendiente'
				              motivo: motivo
				              cliente: cliente
				              veterinario: veterinario
				              mascota: mascota
				              tratamiento: tratamiento ].
	exito := modelo agendarTurno: nuevoTurno.

	exito
		ifTrue: [ UIManager default inform: 'Turno agendado correctamente' ]
		ifFalse: [
			UIManager default inform:
				'No se pudo agendar el turno. Verifique la disponibilidad y las condiciones' ]
]
