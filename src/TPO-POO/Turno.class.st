"
Instance Variables
	cliente:		<Object>
	estado:		<Object>
	fecha:		<Object>
	hora:		<Object>
	mascota:		<Object>
	motivo:		<Object>
	veterinario:		<Object>
"
Class {
	#name : #Turno,
	#superclass : #Object,
	#instVars : [
		'fecha',
		'hora',
		'estado',
		'motivo',
		'cliente',
		'veterinario',
		'mascota'
	],
	#category : #'TPO-POO'
}

{ #category : #constructor }
Turno class >> crearFecha: unaFecha hora: unaHora estado: unEstado motivo: unMotivo cliente: unCliente veterinario: unVeterinario mascota: unaMascota [
|unTurno|
unTurno := self new.
unTurno iniciarFecha: unaFecha hora: unaHora estado: unEstado motivo: unMotivo cliente: unCliente veterinario: unVeterinario mascota: unaMascota.
^unTurno 
]

{ #category : #propio }
Turno >> esAusente [
 ^ estado = 'Ausente'
]

{ #category : #propio }
Turno >> fecha [ 
^fecha 
]

{ #category : #propio }
Turno >> hora [
^hora 
]

{ #category : #iniciador }
Turno >> iniciarFecha: unaFecha hora: unaHora estado: unEstado motivo: unMotivo cliente: unCliente veterinario: unVeterinario mascota: unaMascota [

fecha := unaFecha .
hora := unaHora .
estado := unEstado.
motivo := unMotivo .
cliente := unCliente.
veterinario := unVeterinario .
mascota := unaMascota 
]

{ #category : #propio }
Turno >> mes [
^ fecha month.
]

{ #category : #propio }
Turno >> mismaHora: unaHora [
	^ hora = unaHora.
]

{ #category : #propio }
Turno >> mismoCliente: unCliente [
^cliente = unCliente 
]

{ #category : #propio }
Turno >> mismoDia: unDia [
 ^ fecha = unDia.
]

{ #category : #propio }
Turno >> mismoVet: unVeterinario [
  ^veterinario = unVeterinario.
]

{ #category : #propio }
Turno >> tienePenalizacion: colTurno [

	| colSuple exito |
	colSuple := colTurno select: [ :unTurno |
		            (unTurno mismoCliente: cliente) and: [
			            unTurno esAusente ] ].
	exito := self verificarAusencias: colSuple.
	^exito
	
]

{ #category : #propio }
Turno >> verificarAusencias: colSuplente [

	| cont exito |
	cont := 0.
	exito := true.
	cont := colSuplente do: [ :unTurno | (unTurno mes = fecha month)ifTrue:[cont := cont +1] ].
	cont = 4 ifTrue: [ exito := false ].
	^exito
]

{ #category : #propio }
Turno >> verificarTurno: colTurno [

	| exito |
	exito := cliente buscarMascota: mascota.
	exito ifTrue: [exito := self vetDisponible: colTurno].
	exito ifTrue: [exito := self tienePenalizacion: colTurno].
	^exito 
	
]

{ #category : #propio }
Turno >> vetDisponible: colTurno [

	| exito |
	exito := false. 
	exito := colTurno noneSatisfy: [  :unTurno |
		             (unTurno mismoVet: veterinario) and: [
			             (unTurno mismoDia: fecha) and: [
				             unTurno mismaHora: hora ] ] ]. 
	^ exito
]

{ #category : #propio }
Turno >> veterinario [
^veterinario 
]
