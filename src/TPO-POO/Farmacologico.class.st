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
|costoTotal|  
costoTotal := costoBase + (dosis * (monodroga valorMono)).
costoTotal >= 40000 ifTrue: [ costoTotal * (0.9) ].
^costoTotal 
]

{ #category : #comparacion }
Farmacologico >> esValido [

	| exito |
	exito := monodroga esVentaLibre.
	exito ifFalse: [ super esValido ifTrue: [ exito := true ]  ].
	
	^ exito
]

{ #category : #iniciador }
Farmacologico >> iniciarMonodroga: unaMonodroga dosis: unaDosis frecuencia: unaFrecuencia [
	monodroga := unaMonodroga.
	dosis := unaDosis.
	frecuencia := unaFrecuencia 
]
