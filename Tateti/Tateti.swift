//
//  Tateti.swift
//  Tateti
//
//  Created by Vanesa Korbenfeld on 25/04/2023.
//

import Foundation

class Tateti {
    private var tablero: Tablero = Tablero()
    var jugadorActual: Jugador = .uno
    
    init() {
        iniciarJuego()
    }
    
    private func iniciarJuego() {
        tablero.iniciar()
        jugadorActual = .uno
    }
    
    internal func verResultados() -> [[Int]] {
        return tablero.verTablero()
    }

    func jugar(posición: Posicion) -> String {
        if let posicionATablero = posición.agregarJugadaAlTablero(jugador: jugadorActual, tablero: tablero) {
            return posicionATablero
        }
        
        if let resultado = tablero.obtenerResultado(jugador: jugadorActual) {
            return resultado
        }
        
        cambiarTurnoAlOtroJugador()
       
        return "Próxima ronda juega el jugador: \(jugadorActual.rawValue)"
    }
    
    private func cambiarTurnoAlOtroJugador() {
        jugadorActual = jugadorActual == .uno ? .dos : .uno
    }
}
