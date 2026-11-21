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

{ #category : #propio }
TurnoTratamiento >> hace10Dias [

	^ fecha subtractDays: 10.
]

{ #category : #iniciador }
TurnoTratamiento >> iniciarTrat: unTratamiento [
tratamiento := unTratamiento .
]

{ #category : #accessing }
TurnoTratamiento >> tratamiento [
	^tratamiento 
]

{ #category : #propio }
TurnoTratamiento >> verificarAusencias: colSuple [

	| limiteInferior |
	limiteInferior := self hace10Dias.
	^ colSuple noneSatisfy: [ :unTurno | unTurno fecha between: limiteInferior  and: fecha ]
]

{ #category : #propio }
TurnoTratamiento >> verificarTurno: colTurno [
	|exito|
	exito := super verificarTurno: colTurno.
	exito ifTrue: [ exito := tratamiento esTratValido ].
	^exito
]
