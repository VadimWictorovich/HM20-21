//
//  Person.swift
//  HM20-21
//
//  Created by Вадим Игнатенко on 18.09.23.
//

import Foundation


struct Person {
    let name: String
    let sureName: String
    let email: String
    let phoneNumber: String
}

struct PersonData {
    
    static func createPersons() -> [Person] {
        
        var persons: [Person] = []
        let names = DataStorage.names.shuffled()
        let surnames = DataStorage.surnames.shuffled()
        let emails = DataStorage.emails.shuffled()
        let phones = DataStorage.phones.shuffled()

        for index in 0 ..< names.count {
            let person = Person(name: names[safe: index] ?? "Not data",
                                sureName: surnames[safe: index] ?? "Not data",
                                email: emails[safe: index] ?? "Not data",
                                phoneNumber: phones[safe: index] ?? "Not data")
            persons.append(person)
        }
        return persons
    }
}

extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
