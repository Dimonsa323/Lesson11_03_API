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
}

    // MARK: - Class

class FuturamaPresenter: FuturamaPresenterProtocol {
    let heroesFuturama: [Futurama] = []
}
