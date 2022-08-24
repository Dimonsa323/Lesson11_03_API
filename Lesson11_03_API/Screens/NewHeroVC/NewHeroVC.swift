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
    
    
    
    @IBOutlet weak var imageTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    
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
    
}
