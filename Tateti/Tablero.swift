//
//  Tablero.swift
//  Tateti
//
//  Created by Vanesa Korbenfeld on 25/04/2023.
//

import Foundation

class Tablero {
    private var tablero: [[Int]] = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]

    private let casosGanadores: [[Int]] = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    func iniciar() {
        tablero = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
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
        if casosGanadores.count == 0 {
            return false
        }
        
        if tableroCoincideConCasoGanador(tablero: tablero, caso: casosGanadores.first!, jugador: jugador) {
            return true
        }
        
        let casosGanadoresSinPrimerCaso = casosGanadores.dropFirst()
        
        return hayGanador(tablero: tablero, jugador: jugador, casosGanadores: Array(casosGanadoresSinPrimerCaso))
    }
    
    private func tableroCoincideConCasoGanador(tablero: [Int], caso: [Int], jugador: Jugador) -> Bool {
        if caso.count == 0 {
            return true
        }
        
        if tablero[caso.first!] != jugador.rawValue {
            return false
        }
        
        let casoSinPrimerPosicion = caso.dropFirst()
        return tableroCoincideConCasoGanador(tablero: tablero, caso: Array(casoSinPrimerPosicion), jugador: jugador)
    }
}


