"
Instance Variables
	colTratamiento:		<Object>
	descripcion:		<Object>
	fechaDiagnostico:		<Object>
	mascota:		<Object>
	medico:		<Object>
"
Class {
	#name : #Diagnostico,
	#superclass : #Object,
	#instVars : [
		'fechaDiagnostico',
		'descripcion',
		'medico',
		'mascota',
		'colTratamiento'
	],
	#category : #'TPO-POO'
}

{ #category : #constructor }
Diagnostico class >> crearFechaDiagnostico: unaFecha descripcion: unaDescripcion medico: unMedico mascota: unaMascota colTratamiento: unaColTratamiento [

	| unDiagnostico |
	unDiagnostico := self new.
	unDiagnostico
		iniciarFechaDiagnostico: unaFecha
		descripcion: unaDescripcion
		medico: unMedico
		mascota: unaMascota
		colTratamiento: unaColTratamiento.
	^ unDiagnostico
]

{ #category : #iniciador }
Diagnostico >> iniciarFechaDiagnostico: unaFecha descripcion: unaDescripcion medico: unMedico mascota: unaMascota colTratamiento: unaColTratamiento [

fechaDiagnostico := unaFecha .
descripcion := unaDescripcion .
medico := unMedico .
mascota := unaMascota .
colTratamiento := unaColTratamiento .
]
