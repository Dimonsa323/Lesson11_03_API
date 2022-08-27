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
    func showNextScreen()
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
        networking.newHero { heroesFuturama in
            self.heroesFuturama = heroesFuturama
            closure()
        }
    }
    
    func showNextScreen() {
        
}
}

