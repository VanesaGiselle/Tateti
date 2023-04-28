//
//  Tablero.swift
//  Tateti
//
//  Created by Vanesa Korbenfeld on 25/04/2023.
//

import Foundation

class Tablero {
    private var tablero: [[Int]] = [
        [0, 0, 0],
        [0, 0, 0],
        [0, 0, 0]
    ]

    private let casosGanadores: [[Int]] = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
    ]
    
    func iniciar() {
        tablero = [
            [0, 0, 0],
            [0, 0, 0],
            [0, 0, 0]
        ]
    }
    
    func nuevaRonda(_ nuevoTablero: [[Int]]) {
        tablero = nuevoTablero
    }
    
    func verTablero() -> [[Int]]{
        return tablero
    }
    
    func obtenerResultado(jugador: Jugador) -> String? {
        let agruparTablero = tablero.flatMap({$0})
        
        if hayGanador(tablero: agruparTablero, jugador: jugador, casosGanadores: casosGanadores) {
            return "Ganó el jugador: \(jugador.rawValue)"
        }
        
        if !agruparTablero.contains(0) {
            return "Empate."
        }
        
        return nil
    }
    
    private func hayGanador(tablero: [Int], jugador: Jugador, casosGanadores: [[Int]]) -> Bool {
        guard casosGanadores.first(where: {
            tableroCoincideConCasoGanador(tablero: tablero, caso: $0, jugador: jugador)
        }) != nil else {
            return false
        }
        return true
    }
    
    private func tableroCoincideConCasoGanador(tablero: [Int], caso: [Int], jugador: Jugador) -> Bool {
        return caso.allSatisfy({
            tablero[$0] == jugador.rawValue
        })
    }
}


