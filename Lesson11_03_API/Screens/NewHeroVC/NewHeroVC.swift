//
//  NewHeroVC.swift
//  Lesson11_03_API
//
//  Created by Дима Губеня on 24.08.2022.
//

import UIKit

// MARK: - Class

class NewHeroVC: UIViewController {
    
    // MARK: - Properties
    
    private let presenter: NewHeroPresenterProtocol
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var imageViewOutlet: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    
    
    // MARK: - Init
    
    init(presenter: NewHeroPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction
    
    @IBAction func nextScreenButton() {
        presenter.createUser(vc: self)
    }
    
    @IBAction func addButton() {
        let name = nameTextField.text ?? ""
        let age = ageTextField.text ?? ""
        let newHero = NewHero(name: name, age: age)
        
        presenter.createHero(hero: newHero) {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
