//
//  ImageView.swift
//  Lesson11_03_API
//
//  Created by Дима Губеня on 30.08.2022.
//

import UIKit

class ImageView: UIImageView {
    
    func fetchImage(from url: String) {
        guard let url = URL(string: url) else {
            image = UIImage(systemName: "person")
            return
        }
        if let cachImage = cachedImage(url: url) {
            image = cachImage
            return
        }
        
        Networking.loadAsyncImage(url: url) { data, response in
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
            
            self.saveCache(with: data, and: response)
        }
    }
    
    private func cachedImage(url: URL) -> UIImage? {
        let request = URLRequest(url: url)
        if let response = URLCache.shared.cachedResponse(for: request) {
            return UIImage(data: response.data)
        }
        
        return nil
    }
    
    private func saveCache(with data: Data, and response: URLResponse) {
        guard let urlResponse = response.url else { return }
        let cachedResponse = CachedURLResponse(response: response, data: data)
        let urlRequest = URLRequest(url: urlResponse)
        URLCache.shared.storeCachedResponse(cachedResponse, for: urlRequest)
    }
}
