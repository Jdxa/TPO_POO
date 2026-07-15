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
		'nombreMonodroga',
		'valorMonodroga',
		'ventaLibre',
		'dosis',
		'frecuencia'
	],
	#category : #'TPO-POO'
}

{ #category : #constructor }
Farmacologico class >> crearFecha: unaFecha motivo: unMotivo estado: unEstado nombreMonodroga: unNombreMonodroga valorMonodroga: unValorMonodroga ventaLibre: esVentaLibre dosis: unaDosis frecuencia: unaFrecuencia [
|unTratamiento|
unTratamiento := self new.
unTratamiento iniciarFecha:  unaFecha motivo: unMotivo estado: unEstado.
unTratamiento iniciarNombre: unNombreMonodroga  valorMonodroga: unValorMonodroga ventaLibre: esVentaLibre  dosis: unaDosis frecuencia: unaFrecuencia.
^unTratamiento 
]

{ #category : #iniciador }
Farmacologico >> iniciarNombre: unNombreMonodroga valorMonodroga: unValorMonodroga ventaLibre: esVentaLibre dosis: unaDosis frecuencia: unaFrecuencia [
nombreMonodroga := unNombreMonodroga .
valorMonodroga := unValorMonodroga .
ventaLibre := esVentaLibre .
dosis := unaDosis .
frecuencia := unaFrecuencia  
]
