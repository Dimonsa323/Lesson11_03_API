//
//  FuturamaCell.swift
//  Lesson11_03_API
//
//  Created by Дима Губеня on 24.08.2022.
//

import UIKit

    // MARK: - Class

class FuturamaCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageUI: UIImageView!
    
    
    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    // MARK: - Methods
    
    func config(with model: Futurama) {
        nameLabel.text = model.name
        loadAsyncImage(image: model.picURL) { image in
            self.imageUI.image = image
        }
    }
    
    private func loadAsyncImage(image: String, closure: @escaping (UIImage) -> ()) {
        DispatchQueue.global().async {
            guard let url = URL(string: image) else { return }
            guard let data = try? Data(contentsOf: url) else { return }
            guard let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                closure(image)
            }
        }
    }
}
