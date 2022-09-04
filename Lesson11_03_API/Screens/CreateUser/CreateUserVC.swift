//
//  CreateUserVC.swift
//  Lesson11_03_API
//
//  Created by Дима Губеня on 30.08.2022.
//

import UIKit

    // MARK: - Class CreateUserVC

class CreateUserVC: UIViewController {
    
    // MARK: - Properties
    
    private let presenter: CreateUserPresenterProtocol
    private let cellIdentifaer: String = String(describing: CreateUserCell.self)
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Init
    
    init(presenter: CreateUserPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

    // MARK: - Private Extension

private extension CreateUserVC {
    func setupUI() {
        setupTableView()
        setupNavigationController()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(.init(nibName: cellIdentifaer, bundle: nil), forCellReuseIdentifier: cellIdentifaer)
    }
    
     func setupNavigationController() {
        let rightButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addUser))
        navigationItem.rightBarButtonItem = rightButton
    }

    @objc
    func addUser() {
        presenter.saveInfo(user: "Dima") {
            self.tableView.reloadData()
        }
    }
}


extension CreateUserVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.user.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifaer, for: indexPath) as! CreateUserCell
        let user = presenter.user[indexPath.row]
        cell.config(with: user)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.deleteInfo(indexPath: indexPath) {
            self.tableView.reloadData()
        }
    }
}
