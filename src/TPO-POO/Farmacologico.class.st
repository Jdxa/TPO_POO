"
Instance Variables
	dosis:		<Object>
	frecuencia:		<Object>
	nombreMonodroga:		<Object>
	valorMonodroga:		<Object>
	ventaLibre:		<Object>
"
Class {
	#name : #Farmacologico,
	#superclass : #Tratamiento,
	#instVars : [
		'monodroga',
		'dosis',
		'frecuencia'
	],
	#category : #'TPO-POO'
}

{ #category : #constructor }
Farmacologico class >> crearFecha: unaFecha motivo: unMotivo estado: unEstado monodroga: unaMonodroga dosis: unaDosis frecuencia: unaFrecuencia [

	| unTratamiento |
	unTratamiento := self new.
	unTratamiento
		iniciarFecha: unaFecha
		motivo: unMotivo
		estado: unEstado.
	unTratamiento iniciarMonodroga: unaMonodroga dosis: unaDosis frecuencia: unaFrecuencia.
	^ unTratamiento
]

{ #category : #propio }
Farmacologico >> costoTot [

	| costoTotal |
	costoTotal := CostoBase  + (dosis * monodroga valorMono).
	costoTotal > 40000 ifTrue: [ costoTotal := costoTotal * 0.9 ].
	^ costoTotal
]

{ #category : #comparacion }
Farmacologico >> esTratValido [

	| exito |
	exito := monodroga esVentaLibre.
	exito ifFalse: [ super esTratValido ifTrue: [ exito := true ] ].

	^ exito
]

{ #category : #iniciador }
Farmacologico >> iniciarMonodroga: unaMonodroga dosis: unaDosis frecuencia: unaFrecuencia [
	monodroga := unaMonodroga.
	dosis := unaDosis.
	frecuencia := unaFrecuencia 
]
