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
	#classVars : [
		'TablaRiesgos'
	],
	#category : #'TPO-POO'
}

{ #category : #propios }
Quirurgico class >> agregarRiesgo: unNivel porcentaje: unPorcentaje [
	TablaRiesgos at: unNivel put: unPorcentaje.

]

{ #category : #constructor }
Quirurgico class >> crearFecha: unaFecha motivo: unMotivo estado: unEstado nombre: unNombreProcedimiento nivelRiesgo: unNivelRiesgo tipoAnestesia: unTipoAnestesia [
|unTratamiento|
unTratamiento := self new.
unTratamiento iniciarFecha: unaFecha  motivo: unMotivo estado: unEstado.
unTratamiento iniciarNombre: unNombreProcedimiento  nivelRiesgo: unNivelRiesgo  tipoAnestesia: unTipoAnestesia.
^unTratamiento 
]

{ #category : #propios }
Quirurgico class >> eliminarRiesgo: unNivel [
	TablaRiesgos removeKey: unNivel ifAbsent: [ "no hace nada" ] 
]

{ #category : #propios }
Quirurgico class >> iniciarTabla [
	TablaRiesgos :=  Dictionary new.
	TablaRiesgos at: 1 put: 10.
	TablaRiesgos at: 2 put: 20.
]

{ #category : #propios }
Quirurgico class >> tablaRiesgos [
^TablaRiesgos 
]

{ #category : #propio }
Quirurgico >> costoTot [
	|subTotal totalAnestesia porcentajeRiesgo|
	totalAnestesia := Dictionary new at: 'General' put: 100000; at: 'Regional' put: 60000; at: 'Local' put: 30000;at: tipoAnestesia ifAbsent: [0].
	subTotal := CostoBase + totalAnestesia.
	porcentajeRiesgo := TablaRiesgos at: nivelRiesgo ifAbsent: [ 0 ].
	
	^ subTotal * (1 + (porcentajeRiesgo / 100)) 
	
]

{ #category : #comparacion }
Quirurgico >> esTratValido [

	| exito |
	exito := super esTratValido.
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
