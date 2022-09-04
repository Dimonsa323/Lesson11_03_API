//
//  NewHeroPresenter.swift
//  Lesson11_03_API
//
//  Created by Дима Губеня on 24.08.2022.
//

import Foundation
import UIKit

// MARK: - Protocol

protocol NewHeroPresenterProtocol {
    var heroesFuturama: [Futurama] { get }
    func createHero(hero: NewHero, closureCloseVC: @escaping () -> ())
    func createUser(vc: UIViewController)}

// MARK: - Class

class NewHeroPresenter: NewHeroPresenterProtocol {
    
    // MARK: - Properties
    
    private let networking: NetworkingProtocol
    private let navigator: NavigatorProtocol
    private let closure: ((NewHero) -> ())?
    let heroesFuturama: [Futurama] = []
    
    // MARK: - Init
    
    init(networking: NetworkingProtocol, navigator: NavigatorProtocol, closure: @escaping (NewHero) -> ()) {
        self.networking = networking
        self.navigator = navigator
        self.closure = closure
    }
}

    // MARK: - Private Extension 

extension NewHeroPresenter {
    func createHero(hero: NewHero, closureCloseVC: @escaping () -> ()) {
        networking.postHero(url: APIEndpoint.createHero.rawValue, model: hero) { hero in
            self.closure?(hero)
            closureCloseVC()
        }
    }
    
    func createUser(vc: UIViewController) {
        navigator.showNewUser(view: vc)
    }
}
