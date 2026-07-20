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
		'anestesia'
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
	|unCostoTotal|
	unCostoTotal := (costoBase + (anestesia costo )) * ( 1 + (nivelRiesgo /10)).
	^unCostoTotal 	
]

{ #category : #comparacion }
Quirurgico >> esValido [

	| exito |
	exito := super esValido.
	exito ifTrue: [
		nivelRiesgo = 2 ifTrue: [ exito := anestesia esGeneral ] ].
	^ exito
]

{ #category : #iniciador }
Quirurgico >> iniciarNombre: unNombreProcedimiento nivelRiesgo: unNivelRiesgo tipoAnestesia: unTipoAnestesia [

	nombreProcedimiento := unNombreProcedimiento.
	nivelRiesgo := unNivelRiesgo.
	anestesia := unTipoAnestesia 
]
