//
//  FuturamaCell.swift
//  Lesson11_03_API
//
//  Created by Дима Губеня on 24.08.2022.
//

import UIKit

    // MARK: - Class

class FuturamaCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageUI: ImageView!
    
    
    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    // MARK: - Methods
    
    func config(with model: Futurama) {
        nameLabel.text = model.name
        imageUI.fetchImage(from: model.picURL)
        }
    }
