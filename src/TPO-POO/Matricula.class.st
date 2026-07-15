"
Instance Variables
	colegioEmisor:		<Object>
	fechaInscripcion:		<Object>
	fechaVigencia:		<Object>
	numMat:		<Object>
	tipoAsociado:		<Object>
"
Class {
	#name : #Matricula,
	#superclass : #Object,
	#instVars : [
		'numMat',
		'colegioEmisor',
		'fechaInscripcion',
		'fechaVigencia',
		'tipoAsociado'
	],
	#category : #'TPO-POO'
}

{ #category : #constructor }
Matricula class >> crearNumMat: unNumMat colegioEmisor: unColegio fechaInscripcion: unaFechaInscripcion fechaVigencia: unaFechaVigencia tipoAsociado: unTipo [
|unaMatricula|
unaMatricula := self new.
unaMatricula iniciarNumMat: unNumMat colegioEmisor: unColegio fechaInscripcion: unaFechaInscripcion fechaVigencia: unaFechaVigencia tipoAsociado: unTipo .
^unaMatricula . 
]

{ #category : #iniciar }
Matricula >> iniciarNumMat: unNumMat colegioEmisor: unColegio fechaInscripcion: unaFechaInscripcion fechaVigencia: unaFechaVigencia tipoAsociado: unTipo [
numMat := unNumMat .
colegioEmisor := unColegio .
fechaInscripcion := unaFechaInscripcion .
fechaVigencia := unaFechaVigencia .
tipoAsociado := unTipo .
]
