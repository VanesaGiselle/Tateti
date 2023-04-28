//
//  Posicion.swift
//  Tateti
//
//  Created by Vanesa Korbenfeld on 25/04/2023.
//

import Foundation

class Posicion {
    private let x: PosicionIndex
    private let y: PosicionIndex

    init(x: PosicionIndex, y: PosicionIndex) {
        self.x = x
        self.y = y
    }
    
    func agregarJugadaAlTablero(jugador: Jugador, tablero: Tablero) -> String? {
        var nuevoTablero = tablero.verTablero()
        // hacer mas expresivo
        if nuevoTablero[x.rawValue][y.rawValue] == 1 || nuevoTablero[x.rawValue][y.rawValue] == 2 {
            // excepciones
            return "¡ERROR! La posición ya está ocupada, elegí otra para seguir jugando."
        }
        
        nuevoTablero[x.rawValue][y.rawValue] = jugador.rawValue
        tablero.nuevaRonda(nuevoTablero)
        return nil
    }
}
