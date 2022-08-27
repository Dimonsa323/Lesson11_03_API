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
    
  private let networking = Networking()
    
    func createFirstVC(navigator: NavigatorProtocol) -> UIViewController {
        let presenter = FuturamaPresenter(navigator: navigator, networking: networking)
        let vc = FuturamaVC(presenter: presenter)
        return vc 
    }
    
    func createNewHero(model: Futurama, networking: NetworkingProtocol,
                        navigator: NavigatorProtocol) -> UIViewController {
        let presenter = NewHeroPresenter()
        let vc = NewHeroVC(presenter: presenter)
        
        return vc
    }
}
