//
//  ViewController.swift
//  Tateti
//
//  Created by Vanesa Korbenfeld on 25/04/2023.
//

import UIKit

class ViewController: UIViewController {
    private let tateti = Tateti()
    private let titleText = "Ta-Te-Ti"
    private var statusText = "Empieza el juego, jugador 1"
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var x0y0Button: UIButton = {
        let button = UIButton()
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(x0y0Tapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var x0y1Button: UIButton = {
        let button = UIButton()
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(x0y1Tapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var x0y2Button: UIButton = {
        let button = UIButton()
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(x0y2Tapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var x0StackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [x0y0Button, x0y1Button, x0y2Button])
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var x1y0Button: UIButton = {
        let button = UIButton()
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(x1y0Tapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var x1y1Button: UIButton = {
        let button = UIButton()
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(x1y1Tapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var x1y2Button: UIButton = {
        let button = UIButton()
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(x1y2Tapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var x1StackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [x1y0Button, x1y1Button, x1y2Button])
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var x2y0Button: UIButton = {
        let button = UIButton()
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(x2y0Tapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var x2y1Button: UIButton = {
        let button = UIButton()
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(x2y1Tapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var x2y2Button: UIButton = {
        let button = UIButton()
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(x2y2Tapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var x2StackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [x2y0Button, x2y1Button, x2y2Button])
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var xFirstDividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    private lazy var xSecondDividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    private lazy var yFirstDividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    private lazy var ySecondDividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var volverAJugarButton: UIButton = {
        let button = UIButton()
        button.isHidden = true
        button.backgroundColor = .purple
        button.clipsToBounds = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        view.backgroundColor = .black
        titleLabel.text = titleText
        
        changeStatus()
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        x0StackView.translatesAutoresizingMaskIntoConstraints = false
        x1StackView.translatesAutoresizingMaskIntoConstraints = false
        x2StackView.translatesAutoresizingMaskIntoConstraints = false
        xFirstDividerView.translatesAutoresizingMaskIntoConstraints = false
        xSecondDividerView.translatesAutoresizingMaskIntoConstraints = false
        yFirstDividerView.translatesAutoresizingMaskIntoConstraints = false
        ySecondDividerView.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(titleLabel)
        view.addSubview(x0StackView)
        view.addSubview(x1StackView)
        view.addSubview(x2StackView)
        view.addSubview(xFirstDividerView)
        view.addSubview(xSecondDividerView)
        view.addSubview(yFirstDividerView)
        view.addSubview(ySecondDividerView)
        view.addSubview(statusLabel)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            x0y0Button.heightAnchor.constraint(equalTo: x0y0Button.widthAnchor),
            x0y1Button.heightAnchor.constraint(equalTo: x0y1Button.widthAnchor),
            x0y2Button.heightAnchor.constraint(equalTo: x0y2Button.widthAnchor),
            
            x1y0Button.heightAnchor.constraint(equalTo: x1y0Button.widthAnchor),
            x1y1Button.heightAnchor.constraint(equalTo: x1y1Button.widthAnchor),
            x1y2Button.heightAnchor.constraint(equalTo: x1y2Button.widthAnchor),
            
            x2y0Button.heightAnchor.constraint(equalTo: x2y0Button.widthAnchor),
            x2y1Button.heightAnchor.constraint(equalTo: x2y1Button.widthAnchor),
            x2y2Button.heightAnchor.constraint(equalTo: x2y2Button.widthAnchor),

            x0StackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            x0StackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            x0StackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            x1StackView.topAnchor.constraint(equalTo: x0StackView.bottomAnchor, constant: 20),
            x1StackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            x1StackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            x2StackView.topAnchor.constraint(equalTo: x1StackView.bottomAnchor, constant: 20),
            x2StackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            x2StackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            xFirstDividerView.topAnchor.constraint(equalTo: x0StackView.bottomAnchor, constant: 8),
            xFirstDividerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            xFirstDividerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            xFirstDividerView.heightAnchor.constraint(equalToConstant: 2),
            
            xSecondDividerView.topAnchor.constraint(equalTo: x1StackView.bottomAnchor, constant: 8),
            xSecondDividerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            xSecondDividerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            xSecondDividerView.heightAnchor.constraint(equalToConstant: 2),
            
            yFirstDividerView.topAnchor.constraint(equalTo: x0StackView.topAnchor),
            yFirstDividerView.leadingAnchor.constraint(equalTo: x0y0Button.trailingAnchor),
            yFirstDividerView.widthAnchor.constraint(equalToConstant: 2),
            yFirstDividerView.bottomAnchor.constraint(equalTo: x2StackView.bottomAnchor),
            
            ySecondDividerView.topAnchor.constraint(equalTo: x0StackView.topAnchor),
            ySecondDividerView.trailingAnchor.constraint(equalTo: x0y2Button.leadingAnchor),
            ySecondDividerView.widthAnchor.constraint(equalToConstant: 2),
            ySecondDividerView.bottomAnchor.constraint(equalTo: x2StackView.bottomAnchor),
            
            statusLabel.topAnchor.constraint(equalTo: ySecondDividerView.bottomAnchor, constant: 20),
            statusLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            statusLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    private func changeStatus() {
        statusLabel.text = statusText
        
        if statusText.contains("Ganó") || statusText.contains("Empate.") {
            x0StackView.isUserInteractionEnabled = false
            x1StackView.isUserInteractionEnabled = false
            x2StackView.isUserInteractionEnabled = false
        }
    }
    
    @objc func x0y0Tapped() {
        x0y0Button.setImage(UIImage(named: "\(tateti.jugadorActual.rawValue)"), for: .normal)
        x0y0Button.isEnabled = false
        statusText = tateti.jugar(posición: Posicion(x: .cero, y: .cero))
        changeStatus()
    }
    
    @objc func x0y1Tapped() {
        x0y1Button.setImage(UIImage(named: "\(tateti.jugadorActual.rawValue)"), for: .normal)
        x0y1Button.isEnabled = false
        statusText = tateti.jugar(posición: Posicion(x: .cero, y: .uno))
        changeStatus()
    }
    
    @objc func x0y2Tapped() {
        x0y2Button.setImage(UIImage(named: "\(tateti.jugadorActual.rawValue)"), for: .normal)
        x0y2Button.isEnabled = false
        statusText = tateti.jugar(posición: Posicion(x: .cero, y: .dos))
        changeStatus()
    }
    
    @objc func x1y0Tapped() {
        x1y0Button.setImage(UIImage(named: "\(tateti.jugadorActual.rawValue)"), for: .normal)
        x1y0Button.isEnabled = false
        statusText = tateti.jugar(posición: Posicion(x: .uno, y: .cero))
        changeStatus()
    }
    
    @objc func x1y1Tapped() {
        x1y1Button.setImage(UIImage(named: "\(tateti.jugadorActual.rawValue)"), for: .normal)
        x1y1Button.isEnabled = false
        statusText = tateti.jugar(posición: Posicion(x: .uno, y: .uno))
        changeStatus()
    }
    
    @objc func x1y2Tapped() {
        x1y2Button.setImage(UIImage(named: "\(tateti.jugadorActual.rawValue)"), for: .normal)
        x1y2Button.isEnabled = false
        statusText = tateti.jugar(posición: Posicion(x: .uno, y: .dos))
        changeStatus()
    }
    
    @objc func x2y0Tapped() {
        x2y0Button.setImage(UIImage(named: "\(tateti.jugadorActual.rawValue)"), for: .normal)
        x2y0Button.isEnabled = false
        statusText = tateti.jugar(posición: Posicion(x: .dos, y: .cero))
        changeStatus()
    }
    
    @objc func x2y1Tapped() {
        x2y1Button.setImage(UIImage(named: "\(tateti.jugadorActual.rawValue)"), for: .normal)
        x2y1Button.isEnabled = false
        statusText = tateti.jugar(posición: Posicion(x: .dos, y: .uno))
        changeStatus()
    }
    
    @objc func x2y2Tapped() {
        x2y2Button.setImage(UIImage(named: "\(tateti.jugadorActual.rawValue)"), for: .normal)
        x2y2Button.isEnabled = false
        statusText = tateti.jugar(posición: Posicion(x: .dos, y: .dos))
        changeStatus()
    }
    
}

