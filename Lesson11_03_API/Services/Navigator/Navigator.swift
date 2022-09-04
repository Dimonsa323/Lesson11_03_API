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
    func showNewHero(view: UIViewController, networking: NetworkingProtocol, navigator: NavigatorProtocol, closure: @escaping (NewHero) -> ())
    func showFirstVC() -> UIViewController
    func showNewUser(view: UIViewController)
}

    // MARK: - Class Navigator

class Navigator: NavigatorProtocol {
    
    // MARK: - Properties
    
    let assembler = Assembler()
    
    // MARK: - Method
    
    func showFirstVC() -> UIViewController {
        let vc = assembler.createFirstVC(navigator: self)
        return vc 
    }
    
    func showNewHero(view: UIViewController, networking: NetworkingProtocol, navigator: NavigatorProtocol, closure: @escaping (NewHero) -> ()) {
        let vc = assembler.createNewHero(networking: networking, navigator: self, closure: closure )
        view.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showNewUser(view: UIViewController)  {
        let vc = assembler.createUser()
        view.navigationController?.pushViewController(vc, animated: true)
        
    }
}

