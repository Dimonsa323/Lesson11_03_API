//
//  Futurama.swift
//  Lesson11_03_API
//
//  Created by Дима Губеня on 24.08.2022.
//

import Foundation

struct Futurama: Decodable {
    
    let species: String
    let age: String
    let planet: String
    let profession: String
    let status: String
    let firstAppearance: String
    let picURL: String
    let relatives: String
    let voicedBy: String
    let name: String

    enum CodingKeys: String, CodingKey {
        case species = "Species"
        case age = "Age"
        case planet = "Planet"
        case profession = "Profession"
        case status = "Status"
        case firstAppearance = "FirstAppearance"
        case picURL = "PicUrl"
        case relatives = "Relatives"
        case voicedBy = "VoicedBy"
        case name = "Name"
    }
    
    init(model: NewHero) {
        self.species = ""
        self.age = model.age
        self.planet = ""
        self.profession = ""
        self.status = ""
        self.firstAppearance = ""
        self.picURL = ""
        self.relatives = ""
        self.voicedBy = ""
        self.name = model.name
    }
}
