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
		posicion: 30 @ 450
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

	| diagnosticoTexto numero diagnostico tipo fechaTexto fecha motivo estado tratamiento nombreMono monodroga dosisTexto frecuencia partes|
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
	fecha := Date year: (partes at: 3)asNumber month: (partes at: 2)asNumber day:  (partes at: 1)asNumber .

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

	diagnostico agregarTratamiento: tratamiento.

	UIManager default inform: 'Tratamiento asignado correctamente'
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

	UIManager default inform: 'Diagnostico facturado'
]

{ #category : #initialize }
VentanaPrincipal >> initialize [

	super initialize.

	modelo := Veterinaria crearCuit: '20-0000000-0'.
	self cargarVeterinariosPrueba.
	self cargarMonodrogasPrueba.

	self extent: 800 @ 600.
	self color: Color veryLightGray.

	self agregarTitulo.
	self agregarListaClientes.
	self agregarCantidadMascotas.
	self agregarBotones.

	self actualizarListaClientes.
	self actualizarCantidadMascotas
]

{ #category : #botones }
VentanaPrincipal >> registrarAtencion [

	UIManager default inform: 'Registrar atencion'
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

	| dniCliente cliente nombreMascota mascota dniVeterinario veterinario fechaTexto fecha descripcion nuevoDiagnostico |
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

	fechaTexto := UIManager default request:
		              'Fecha del diagnostico (DD-MM-AAAA)'.
	fechaTexto ifNil: [ ^ self ].

	fecha := Date readFrom: fechaTexto readStream.

	descripcion := UIManager default request:
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

	UIManager default inform: 'Pago registrado'
]

{ #category : #botones }
VentanaPrincipal >> solicitarTurno [

	| dniCliente cliente nombreMascota mascota dniVeterinario veterinario fechaTexto fecha hora motivo nuevoTurno exito |
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
		UIManager default inform: 'El cliente no tiene mascota'.
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

	fechaTexto := UIManager default request: 'Fecha (DD/MM/AAAA)'.
	fechaTexto ifNil: [ ^ self ].
	fecha := Date readFrom: fechaTexto readStream.
	hora := UIManager default request: 'Hora'.
	hora ifNil: [ ^ self ].

	motivo := UIManager default request: 'Motivo del turno'.
	motivo ifNil: [ ^ self ].

	nuevoTurno := Turno
		              crearFecha: fecha
		              hora: hora
		              estado: 'Pendiente'
		              motivo: motivo
		              cliente: cliente
		              veterinario: veterinario
		              mascota: mascota.
	exito := modelo agendarTurno: nuevoTurno.
	exito
		ifTrue: [ UIManager default inform: 'Turno agendado correctamente' ]
		ifFalse: [
			UIManager default inform:
				'No se pudo agendar el turno. Verifique la disponibilidad y las condiciones' ].
]
