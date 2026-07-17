"
Instance Variables
	tratamiento:		<Object>
"
Class {
	#name : #TurnoTratamiento,
	#superclass : #Turno,
	#instVars : [
		'tratamiento'
	],
	#category : #'TPO-POO'
}

{ #category : #constructor }
TurnoTratamiento class >> crearFecha:  unaFecha hora: unaHora estado: unEstado motivo: unMotivo cliente: unCliente veterinario: unVeterinario mascota: unaMascota tratamiento: unTratamiento [
|unTurno|
unTurno := self crearFecha: unaFecha hora: unaHora estado: unEstado motivo: unMotivo cliente: unCliente veterinario: unVeterinario mascota: unaMascota.
unTurno iniciarTrat: unTratamiento.
^unTurno 
]

{ #category : #iniciador }
TurnoTratamiento >> iniciarTrat: unTratamiento [
tratamiento := unTratamiento .
]
