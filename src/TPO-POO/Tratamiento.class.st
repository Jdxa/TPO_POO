"
Instance Variables
	estado:		<Object>
	fecha:		<Object>
	motivo:		<Object>
"
Class {
	#name : #Tratamiento,
	#superclass : #Object,
	#instVars : [
		'fecha',
		'motivo',
		'estado'
	],
	#classVars : [
		'CostoBase'
	],
	#category : #'TPO-POO'
}

{ #category : #propio }
Tratamiento class >> costoBase [
CostoBase ifNil: [ CostoBase := 5000 ].
	^ CostoBase
]

{ #category : #constructor }
Tratamiento class >> crearFecha: unaFecha motivo: unMotivo estado: unEstado [

	| unTratamiento |
	unTratamiento := self new.
	unTratamiento
		iniciarFecha: unaFecha
		motivo: unMotivo
		estado: unEstado.
	CostoBase := 5000.
	^ unTratamiento
]

{ #category : #propio }
Tratamiento >> costoTot [

 ^ self subclassResponsibility 
]

{ #category : #comparacion }
Tratamiento >> esTratValido [

	^ fecha dayOfWeek between: 2 and: 6
]

{ #category : #accessing }
Tratamiento >> estado [
	^estado 
]

{ #category : #accessing }
Tratamiento >> estado: unEstado [

estado := unEstado 
]

{ #category : #iniciador }
Tratamiento >> iniciarFecha: unaFecha motivo: unMotivo estado: unEstado [

	fecha := unaFecha.
	motivo := unMotivo.
	estado := unEstado.
]

{ #category : #accessing }
Tratamiento >> motivo [ 
^motivo
]
