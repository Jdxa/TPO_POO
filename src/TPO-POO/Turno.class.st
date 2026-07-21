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
Turno >> veterinario [
^veterinario 
]
