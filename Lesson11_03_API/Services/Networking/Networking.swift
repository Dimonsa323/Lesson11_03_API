//
//  Networking.swift
//  Lesson11_03_API
//
//  Created by Дима Губеня on 24.08.2022.
//

import Foundation
import UIKit

    // MARK: - Protocol

protocol NetworkingProtocol {
    func newHero<T: Decodable>(closure: @escaping ([T]) -> ())
    func loadAsyncImage(image: String, closure: @escaping (UIImage) -> ())
}

    // MARK: - Class Networking

class Networking: NetworkingProtocol {
    
    func newHero<T: Decodable>(closure: @escaping (T) -> ()) {
        let stringURL = "https://futuramaapi.herokuapp.com/api/v2/characters"
        guard let infoURL = URL(string: stringURL) else { return }
        
        URLSession.shared.dataTask(with: infoURL) { data, response, error in
            if let error = error {
                print (error)
                return
            }
            
            if let response = response {
                print(response)
            }
            
            guard let data = data else {
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let model = try decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    closure(model)
                }
            } catch let error {
                print(error.localizedDescription)
            }
        } .resume()
    }
    
    func loadAsyncImage(image: String, closure: @escaping (UIImage) -> ()) {
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
