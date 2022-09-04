//
//  CreateUserPresenter.swift
//  Lesson11_03_API
//
//  Created by Дима Губеня on 30.08.2022.
//

import Foundation

    // MARK: - Protocol

protocol CreateUserPresenterProtocol {
    
    var user: [String] { get }

    func saveInfo(user: String, closure: @escaping () -> ())
    func deleteInfo(indexPath: IndexPath, closure: @escaping () -> ())
}

// MARK: - Class CreateUser

class CreateUserPresenter {
    
    // MARK: - Properties
    
    var user: [String] = []
    
    // MARK: - Init
    
    init() {
        user = infoContacts()
    }
    
    private let userDefaults = UserDefaults.standard
    private let userKey = "user"
}



// MARK: - Private Extension

extension CreateUserPresenter: CreateUserPresenterProtocol {
    
    func saveInfo(user: String, closure: @escaping () -> ()) {
        var contacts = infoContacts()
        contacts.append(user)
        userDefaults.set(contacts, forKey: userKey)
        
        self.user.append(user)
        closure()
    }
    
    func infoContacts() -> [String] {
        if let contacts = userDefaults.value(forKey: userKey) as? [String] {
            return contacts
        }
        
        return []
    }
    
    func deleteInfo(indexPath: IndexPath, closure: @escaping () -> ()) {
        var contacts = infoContacts()
        contacts.remove(at: indexPath.row)
        userDefaults.set(contacts, forKey: userKey)

        user.remove(at: indexPath.row)
        closure()
    }
}

