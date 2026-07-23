"
subclase consulta de turno(abs)
"
Class {
	#name : #TurnoConsulta,
	#superclass : #Turno,
	#category : #'TPO-POO'
}

{ #category : #propio }
TurnoConsulta >> esTurnValido: unaColTurnos [

	| exito unaColValida contador |
	exito := super esTurnValido: unaColTurnos.
	exito ifTrue: [
		unaColValida := unaColTurnos select: [ :turno |
			                (turno mismoCliente: cliente) and: [
				                turno esCancelado ]].
		
		 ]
]
