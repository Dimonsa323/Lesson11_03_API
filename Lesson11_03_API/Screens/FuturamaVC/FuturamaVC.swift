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
    
    // MARK: - IBOutlets
    
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
        setupUI()
        presenter.newHero {
            self.tableView.reloadData()
        }
    }
    
    // MARK: - IBAction
    
    @IBAction func addHeroButton() {
        presenter.showNextScreen(vc: self) {
            self.tableView.reloadData()
        }
    }
}

// MARK: - Private Extension

extension FuturamaVC {
    func setupUI() {
        setupTableView()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(.init(nibName: String(describing: FuturamaCell.self), bundle: nil), forCellReuseIdentifier: String(describing: FuturamaCell.self))
    }
}

extension FuturamaVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.heroesFuturama.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FuturamaCell.self), for: indexPath) as! FuturamaCell
        let hero = presenter.heroesFuturama[indexPath.row]
        cell.config(with: hero )
        
        return cell
    }
}

