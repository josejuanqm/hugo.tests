//
//  PeopleDataSource.swift
//  CRUD
//
//  Created by Jose Quintero on 12/5/20.
//

import Foundation

class PeopleDataSource: Codable {
    static private(set) var `default`: PeopleDataSource? = nil
    var data: [Person] = []
    
    init() {
        let storage = UserDefaults.standard
        if let dataStorage = storage.data(forKey: "Data") {
            do {
                let decoder = JSONDecoder()
                let d = try decoder.decode(PeopleDataSource.self, from: dataStorage)
                PeopleDataSource.default = d
            } catch {
                //
            }
        }
    }
    
    private func save() {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(self)
            UserDefaults.standard.set(data, forKey: "Data")
            UserDefaults.standard.synchronize()
        } catch {
            //
        }
    }
    
    func add(person: Person) {
        data.append(person)
        save()
    }
    
    func remove(person: Person) {
        guard let index = data.firstIndex(where: {
            "\(person.firstName),\(person.lastName)" ==
                "\($0.firstName),\($0.lastName)"
        }) else { return }
        data.remove(at: index)
        save()
    }
    
    func update(person: Person, with details: Person.Details) {
        guard let index = data.firstIndex(where: {
            "\(person.firstName),\(person.lastName)" ==
                "\($0.firstName),\($0.lastName)"
        }) else { return }
        data.remove(at: index)
        
        let newPerson = Person(firstName: details.firstName, lastName: details.lastName)
        data.append(newPerson)
        save()
    }
}
