//
//  FuturamaVC.swift
//  Lesson11_03_API
//
//  Created by Дима Губеня on 24.08.2022.
//

import UIKit

    // MARK: - Class

class FuturamaVC: UIViewController {

    // MARK: - Properties
    
    private let presenter: FuturamaPresenterProtocol
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Init
    
    init(presenter: FuturamaPresenterProtocol) {
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
    
    @IBAction func addHeroButton() {
    }
}
