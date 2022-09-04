//
//  APIEndpoint.swift
//  Lesson11_03_API
//
//  Created by Дима Губеня on 28.08.2022.
//

import Foundation

enum APIEndpoint: String {
    case getHeroes = "https://futuramaapi.herokuapp.com/api/v2/characters"
    case createHero = "https://jsonplaceholder.typicode.com/posts"
}

typealias HTTPCodes = Range<Int>

extension HTTPCodes {
    static let success = 200..<300
}
