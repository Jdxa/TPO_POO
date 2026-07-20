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
Diagnostico class >> crearFecha: unaFecha descripcion: unaDescripcion medico: unMedico mascota: unaMascota [ 

	| unDiagnostico |
	unDiagnostico := self new.
	unDiagnostico
		iniciarFechaDiagnostico: unaFecha
		descripcion: unaDescripcion
		medico: unMedico
		mascota: unaMascota.
	^ unDiagnostico
]

{ #category : #iniciador }
Diagnostico >> agregarTratamiento: unTratamiento [
	unTratamiento esValido ifTrue: [colTratamiento add: unTratamiento]. 
]

{ #category : #propio }
Diagnostico >> calcularCosto [
	|costoTot|
	costoTot := 0.
	colTratamiento do: [ :tratamiento | costoTot := costoTot + tratamiento costoTot ].
	^costoTot
]

{ #category : #iniciador }
Diagnostico >> iniciarFechaDiagnostico: unaFecha descripcion: unaDescripcion medico: unMedico mascota: unaMascota [

	fechaDiagnostico := unaFecha.
	descripcion := unaDescripcion.
	medico := unMedico.
	mascota := unaMascota.
	colTratamiento := OrderedCollection new.
]
