"
Instance Variables
	nivelRiesgo:		<Object>
	nombreProcedimiento:		<Object>
	tipoAnestesia:		<Object>
"
Class {
	#name : #Quirurgico,
	#superclass : #Tratamiento,
	#instVars : [
		'nombreProcedimiento',
		'nivelRiesgo',
		'tipoAnestesia'
	],
	#category : #'TPO-POO'
}

{ #category : #constructor }
Quirurgico class >> crearFecha: unaFecha motivo: unMotivo estado: unEstado nombre: unNombreProcedimiento nivelRiesgo: unNivelRiesgo tipoAnestesia: unTipoAnestesia [
|unTratamiento|
unTratamiento := self new.
unTratamiento iniciarFecha: unaFecha  motivo: unMotivo estado: unEstado.
unTratamiento iniciarNombre: unNombreProcedimiento  nivelRiesgo: unNivelRiesgo  tipoAnestesia: unTipoAnestesia.
^unTratamiento 
]

{ #category : #propio }
Quirurgico >> costoTot [

	| unCostoTotal |
	unCostoTotal := super costoTot.
	tipoAnestesia = 'Local' ifTrue: [ unCostoTotal := unCostoTotal + 30000 ].
	tipoAnestesia = 'Regional' ifTrue: [ unCostoTotal := unCostoTotal + 60000 ].
	tipoAnestesia = 'General' ifTrue: [ unCostoTotal := unCostoTotal + 100000 ].
	unCostoTotal := unCostoTotal * (1 +(nivelRiesgo /10 )).
	^ unCostoTotal
]

{ #category : #comparacion }
Quirurgico >> esValido [

	| exito |
	exito := super esValido.
	exito ifTrue: [
		nivelRiesgo = 2 ifTrue: [ exito := tipoAnestesia = 'General' ] ].
	^ exito
]

{ #category : #iniciador }
Quirurgico >> iniciarNombre: unNombreProcedimiento nivelRiesgo: unNivelRiesgo tipoAnestesia: unTipoAnestesia [

	nombreProcedimiento := unNombreProcedimiento.
	nivelRiesgo := unNivelRiesgo.
	tipoAnestesia := unTipoAnestesia
]
