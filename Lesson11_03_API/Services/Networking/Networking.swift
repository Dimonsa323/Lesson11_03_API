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
    func newHero<T: Decodable>(stringURL: String, closure: @escaping ([T]) -> ())
//    func loadAsyncImage(url: URL, closure: @escaping (UIImage) -> ())
    func postHero<T: Codable>(url: String, model: T, closure: @escaping (T) -> ())
}

// MARK: - Class Networking

class Networking: NetworkingProtocol {
    
    func newHero<T: Decodable>(stringURL: String, closure: @escaping (T) -> ()) {
        guard let infoURL = URL(string: stringURL) else { return }
        
        URLSession.shared.dataTask(with: infoURL) { data, response, error in
            if let error = error {
                print (error)
                return
            }
            
            guard let response = response, let code = (response as? HTTPURLResponse)?.statusCode else {
                return
            }
            
            print("Code ------> \(code)")
            
            guard HTTPCodes.success.contains(code) else {
                return
            }
            
            guard let data = data else { return }
            print("Response Data -----------> \(String(data: data, encoding: .utf8))")
            
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
    
    static func loadAsyncImage(url: URL, closure: @escaping (Data, URLResponse) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data, let response = response else {
                return
            }
            
            guard let responseURL = response.url else {
                return
            }
            
            guard url == responseURL else { return }
            
            closure(data, response)
        }
    }

func postHero<T: Codable>(url: String, model: T, closure: @escaping (T) -> ()) {
    guard let url = URL(string: url) else { return }
    guard let request = heroURLRequest(model: model, url: url) else { return }
    
    URLSession.shared.dataTask(with: request) { data, response, error in
        
        if let error = error {
            print(error)
            return
        }
        
        guard let code = (response as? HTTPURLResponse)?.statusCode else {
            return
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
            print(error)
        }
    }.resume()
}

private func heroURLRequest<T: Encodable>(model: T, url: URL) -> URLRequest? {
    guard let data = try? JSONEncoder().encode(model) else {
        return nil
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpBody = data
    
    return request
}
}




