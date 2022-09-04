//
//  FuturamaPresenter.swift
//  Lesson11_03_API
//
//  Created by Дима Губеня on 24.08.2022.
//

import Foundation
import UIKit

// MARK: - Protocol

protocol FuturamaPresenterProtocol {
    
    var heroesFuturama: [Futurama] { get }
    func newHero(closure: @escaping () -> ())
    func showNextScreen(vc: UIViewController, closure: @escaping () -> ())
}

// MARK: - Class

class FuturamaPresenter: FuturamaPresenterProtocol {
    
    // MARK: - Properties
    
    var heroesFuturama: [Futurama] = []
    private let navigator: NavigatorProtocol
    private let networking: NetworkingProtocol
    
    // MARK: - Init
    
    init(navigator: NavigatorProtocol, networking: NetworkingProtocol) {
        self.navigator = navigator
        self.networking = networking
    }
    
    // MARK: - Method
    
    func newHero(closure: @escaping () -> ()) {
        networking.newHero(stringURL: APIEndpoint.getHeroes.rawValue) { (heroesFuturama: [Futurama]) in
            self.heroesFuturama = heroesFuturama
            closure()
        }
    }
    
    func showNextScreen(vc: UIViewController, closure: @escaping () -> ()) {
        navigator.showNewHero(view: vc, networking: networking, navigator: navigator) { hero in
            let hero = Futurama(model: hero)
            self.heroesFuturama.append(hero)
            closure()
        }
    }
}

