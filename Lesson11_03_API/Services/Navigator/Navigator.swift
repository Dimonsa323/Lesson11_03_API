//
//  Navigator.swift
//  Lesson11_03_API
//
//  Created by Дима Губеня on 24.08.2022.
//

import Foundation
import UIKit

    // MARK: - Protocol

protocol NavigatorProtocol {
    func showNewHero(model: Futurama, view: UIViewController, networking: NetworkingProtocol)
    func showFirstVC() -> UIViewController
}

    // MARK: - Class Navigator

class Navigator: NavigatorProtocol {
    
    let assembler = Assembler()
    
    func showFirstVC() -> UIViewController {
        let vc = assembler.createFirstVC(navigator: self)
        return vc 
    }
    
    func showNewHero(model: Futurama, view: UIViewController, networking: NetworkingProtocol) {
        let vc = assembler.createNewHero(model: model, networking: networking, navigator: self )
        view.navigationController?.pushViewController(vc, animated: true)
    }
}

