//
//  Tateti.swift
//  Tateti
//
//  Created by Vanesa Korbenfeld on 25/04/2023.
//

import Foundation

class Tateti {
    private var tablero: Tablero = Tablero()
    private var jugador: Jugador = .uno
    
    init() {
        iniciarJuego()
    }
    
    private func iniciarJuego() {
        tablero.iniciar()
    }
    
    func verResultados() -> [[Int]] {
        return tablero.verTablero()
    }

    func seJuega(posición: Posicion) -> String {
        if let posicionATablero = posición.transformarPosicionATablero(jugador: jugador, tablero: tablero) {
            return posicionATablero
        }
        
        if let resultado = tablero.obtenerResultado(jugador: jugador) {
            return resultado
        }
        
        jugador = jugador == .uno ? .dos : .uno
       
        return "Próxima ronda juega el jugador: \(jugador.rawValue)"
    }
}
