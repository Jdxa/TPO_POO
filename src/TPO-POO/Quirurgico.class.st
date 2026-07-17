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

{ #category : #comparacion }
Quirurgico >> esValido [

	| exito |
	exito := super esValido.
	[ exito ] ifTrue: [
		[ nivelRiesgo = 2 ] ifTrue: [
			[ tipoAnestesia = 'General' ] ifFalse: [ exito := false ] ] ].
	^ exito
]

{ #category : #iniciador }
Quirurgico >> iniciarNombre: unNombreProcedimiento nivelRiesgo: unNivelRiesgo tipoAnestesia: unTipoAnestesia [
nombreProcedimiento := unNombreProcedimiento .
nivelRiesgo := unNivelRiesgo .
tipoAnestesia := unTipoAnestesia 
]
