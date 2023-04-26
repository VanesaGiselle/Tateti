//
//  TatetiTests.swift
//  TatetiTests
//
//  Created by Vanesa Korbenfeld on 25/04/2023.
//

import XCTest
@testable import Tateti

class TatetiTests: XCTestCase {
    func testGanaJugadorUno_CasoGanadorHorizontal() throws {
        let tateti = Tateti()
        XCTAssertEqual("Próxima ronda juega el jugador: 2", tateti.seJuega(posición: Posicion(x: .cero, y: .cero)))
        XCTAssertEqual(tateti.verResultados(), [[1, 0, 0], [0, 0, 0], [0, 0, 0]])
        XCTAssertEqual("Próxima ronda juega el jugador: 1", tateti.seJuega(posición: Posicion(x: .uno, y: .uno)))
        XCTAssertEqual(tateti.verResultados(), [[1, 0, 0], [0, 2, 0], [0, 0, 0]])
        XCTAssertEqual("Próxima ronda juega el jugador: 2", tateti.seJuega(posición: Posicion(x: .cero, y: .uno)))
        XCTAssertEqual(tateti.verResultados(), [[1, 1, 0], [0, 2, 0], [0, 0, 0]])
        XCTAssertEqual("Próxima ronda juega el jugador: 1", tateti.seJuega(posición: Posicion(x: .dos, y: .uno)))
        XCTAssertEqual(tateti.verResultados(), [[1, 1, 0], [0, 2, 0], [0, 2, 0]])
        XCTAssertEqual("Ganó el jugador: 1", tateti.seJuega(posición: Posicion(x: .cero, y: .dos)))
        XCTAssertEqual(tateti.verResultados(), [[1, 1, 1], [0, 2, 0], [0, 2, 0]])
    }
    
    func testGanaJugadorDos_CasoGanadorDiagonal() throws {
        let tateti = Tateti()
        XCTAssertEqual("Próxima ronda juega el jugador: 2", tateti.seJuega(posición: Posicion(x: .uno, y: .cero)))
        XCTAssertEqual(tateti.verResultados(), [[0, 0, 0], [1, 0, 0], [0, 0, 0]])
        XCTAssertEqual("Próxima ronda juega el jugador: 1", tateti.seJuega(posición: Posicion(x: .cero, y: .cero)))
        XCTAssertEqual(tateti.verResultados(), [[2, 0, 0], [1, 0, 0], [0, 0, 0]])
        XCTAssertEqual("Próxima ronda juega el jugador: 2", tateti.seJuega(posición: Posicion(x: .uno, y: .dos)))
        XCTAssertEqual(tateti.verResultados(), [[2, 0, 0], [1, 0, 1], [0, 0, 0]])
        XCTAssertEqual("Próxima ronda juega el jugador: 1", tateti.seJuega(posición: Posicion(x: .uno, y: .uno)))
        XCTAssertEqual(tateti.verResultados(), [[2, 0, 0], [1, 2, 1], [0, 0, 0]])
        XCTAssertEqual("Próxima ronda juega el jugador: 2", tateti.seJuega(posición: Posicion(x: .dos, y: .cero)))
        XCTAssertEqual(tateti.verResultados(), [[2, 0, 0], [1, 2, 1], [1, 0, 0]])
        XCTAssertEqual("Ganó el jugador: 2", tateti.seJuega(posición: Posicion(x: .dos, y: .dos)))
        XCTAssertEqual(tateti.verResultados(), [[2, 0, 0], [1, 2, 1], [1, 0, 2]])
    }
    
    func testGanaJugadorUno_CasoGanadorVertical() throws {
        let tateti = Tateti()
        XCTAssertEqual("Próxima ronda juega el jugador: 2", tateti.seJuega(posición: Posicion(x: .cero, y: .cero)))
        XCTAssertEqual(tateti.verResultados(), [[1, 0, 0], [0, 0, 0], [0, 0, 0]])
        XCTAssertEqual("Próxima ronda juega el jugador: 1", tateti.seJuega(posición: Posicion(x: .uno, y: .uno)))
        XCTAssertEqual(tateti.verResultados(), [[1, 0, 0], [0, 2, 0], [0, 0, 0]])
        XCTAssertEqual("Próxima ronda juega el jugador: 2", tateti.seJuega(posición: Posicion(x: .uno, y: .cero)))
        XCTAssertEqual(tateti.verResultados(), [[1, 0, 0], [1, 2, 0], [0, 0, 0]])
        XCTAssertEqual("Próxima ronda juega el jugador: 1", tateti.seJuega(posición: Posicion(x: .dos, y: .uno)))
        XCTAssertEqual(tateti.verResultados(), [[1, 0, 0], [1, 2, 0], [0, 2, 0]])
        XCTAssertEqual("Ganó el jugador: 1", tateti.seJuega(posición: Posicion(x: .dos, y: .cero)))
        XCTAssertEqual(tateti.verResultados(), [[1, 0, 0], [1, 2, 0], [1, 2, 0]])
    }
    
    func testErrorAlPisarPosicionYaJugada() throws {
        let tateti = Tateti()
        XCTAssertEqual("Próxima ronda juega el jugador: 2", tateti.seJuega(posición: Posicion(x: .cero, y: .cero)))
        XCTAssertEqual(tateti.verResultados(), [[1, 0, 0], [0, 0, 0], [0, 0, 0]])
        XCTAssertEqual("¡ERROR! La posición ya está ocupada, elegí otra para seguir jugando.", tateti.seJuega(posición: Posicion(x: .cero, y: .cero)))
    }
    
    func testEmpate() throws {
        let tateti = Tateti()
        XCTAssertEqual("Próxima ronda juega el jugador: 2", tateti.seJuega(posición: Posicion(x: .cero, y: .cero)))
        XCTAssertEqual(tateti.verResultados(), [[1, 0, 0], [0, 0, 0], [0, 0, 0]])
        XCTAssertEqual("Próxima ronda juega el jugador: 1", tateti.seJuega(posición: Posicion(x: .uno, y: .uno)))
        XCTAssertEqual(tateti.verResultados(), [[1, 0, 0], [0, 2, 0], [0, 0, 0]])
        XCTAssertEqual("Próxima ronda juega el jugador: 2", tateti.seJuega(posición: Posicion(x: .uno, y: .cero)))
        XCTAssertEqual(tateti.verResultados(), [[1, 0, 0], [1, 2, 0], [0, 0, 0]])
        XCTAssertEqual("Próxima ronda juega el jugador: 1", tateti.seJuega(posición: Posicion(x: .dos, y: .cero)))
        XCTAssertEqual(tateti.verResultados(), [[1, 0, 0], [1, 2, 0], [2, 0, 0]])
        XCTAssertEqual("Próxima ronda juega el jugador: 2", tateti.seJuega(posición: Posicion(x: .cero, y: .dos)))
        XCTAssertEqual(tateti.verResultados(), [[1, 0, 1], [1, 2, 0], [2, 0, 0]])
        XCTAssertEqual("Próxima ronda juega el jugador: 1", tateti.seJuega(posición: Posicion(x: .cero, y: .uno)))
        XCTAssertEqual(tateti.verResultados(), [[1, 2, 1], [1, 2, 0], [2, 0, 0]])
        XCTAssertEqual("Próxima ronda juega el jugador: 2", tateti.seJuega(posición: Posicion(x: .uno, y: .dos)))
        XCTAssertEqual(tateti.verResultados(), [[1, 2, 1], [1, 2, 1], [2, 0, 0]])
        XCTAssertEqual("Próxima ronda juega el jugador: 1", tateti.seJuega(posición: Posicion(x: .dos, y: .dos)))
        XCTAssertEqual(tateti.verResultados(), [[1, 2, 1], [1, 2, 1], [2, 0, 2]])
        XCTAssertEqual("Empate.", tateti.seJuega(posición: Posicion(x: .dos, y: .uno)))
        XCTAssertEqual(tateti.verResultados(), [[1, 2, 1], [1, 2, 1], [2, 1, 2]])
    }
}
