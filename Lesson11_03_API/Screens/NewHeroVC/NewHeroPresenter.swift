//
//  NewHeroPresenter.swift
//  Lesson11_03_API
//
//  Created by Дима Губеня on 24.08.2022.
//

import Foundation

// MARK: - Protocol

protocol NewHeroPresenterProtocol {
var heroesFuturama: [Futurama] { get }
}

// MARK: - Class

class NewHeroPresenter: NewHeroPresenterProtocol {
let heroesFuturama: [Futurama] = []
}
