//
//  Assembler.swift
//  Lesson11_03_API
//
//  Created by Дима Губеня on 24.08.2022.
//

import Foundation
import UIKit

    // MARK: Assembler

class Assembler {
    
    // MARK: - Properties
    
  private let networking = Networking()
    
    // MARK: - Method
    
    func createFirstVC(navigator: NavigatorProtocol) -> UIViewController {
        let presenter = FuturamaPresenter(navigator: navigator, networking: networking)
        let vc = FuturamaVC(presenter: presenter)
        
        return vc 
    }
    
    func createNewHero(networking: NetworkingProtocol,
                        navigator: NavigatorProtocol, closure: @escaping (NewHero) -> ()) -> UIViewController {
        let presenter = NewHeroPresenter(networking: networking, navigator: navigator, closure: closure)
        let vc = NewHeroVC(presenter: presenter)
        return vc
    }
    
    func createUser() -> UIViewController {
        let presenter = CreateUserPresenter()
        let vc = CreateUserVC(presenter: presenter)
        return vc
    }
}
