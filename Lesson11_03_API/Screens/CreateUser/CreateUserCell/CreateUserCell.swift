//
//  CreateUserCell.swift
//  Lesson11_03_API
//
//  Created by Дима Губеня on 30.08.2022.
//

import UIKit

    // MARK: - CreateUserCell

class CreateUserCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var nameUserLabel: UILabel!
    
    // MARK: Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    // MARK: - Method
    
    func config(with user: String) {
        nameUserLabel.text = user
    }
}
