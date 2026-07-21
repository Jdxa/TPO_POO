"
Instance Variables
	nombreMono:		<Object>
	stock:		<Object>
	valorMono:		<Object>
	ventaLibre:		<Object>
"
Class {
	#name : #Monodroga,
	#superclass : #Object,
	#instVars : [
		'nombreMono',
		'valorMono',
		'ventaLibre',
		'stock'
	],
	#category : #'TPO-POO'
}

{ #category : #constructor }
Monodroga class >> crearNombre: unNombreMonodroga valorMono: unValorMono ventaLibre: esVentaLibre stock: unStock [
 |unaMonodroga|
unaMonodroga := self new.
unaMonodroga iniciarNombre: unNombreMonodroga valorMono: unValorMono ventaLibre: esVentaLibre stock: unStock.
^unaMonodroga 
]

{ #category : #comparacion }
Monodroga >> esVentaLibre [
  ^ ventaLibre
]

{ #category : #iniciador }
Monodroga >> iniciarNombre: unNombreMonodroga valorMono: unValor ventaLibre: esVentaLibre stock: unStock [
nombreMono := unNombreMonodroga.
valorMono := unValor .
ventaLibre := esVentaLibre.
stock := unStock.
]

{ #category : #accesors }
Monodroga >> stock [
^stock
]

{ #category : #accesors }
Monodroga >> tieneStock [

	^ stock > 1
]

{ #category : #accesors }
Monodroga >> valorMono [
^valorMono 
]
