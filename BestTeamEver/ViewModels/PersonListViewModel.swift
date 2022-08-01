//
//  PersonListViewModel.swift
//  BestTeamEver
//
//  Created by Tatiana Bondarenko on 8/1/22.
//

import Foundation

class PersonListViewModel: ObservableObject {
    
    @Published var persons: [Person] = [
        Person(name: "Tiffany", title: "CEO/Project Manager", image: "tiffany", bio: "....."),
        Person(name: "Lily", title: "Senior iOS Developer", image: "lily", bio: "....."),
        Person(name: "Niwei", title: "Senior iOS Developer", image: "niwei", bio: "....."),
        Person(name: "Sasha", title: "Senior iOS Developer", image: "sasha", bio: "....."),
        Person(name: "Tatiana", title: "Senior iOS Developer", image: "tatiana", bio: ".....")
    ]
    
    // MARK: - Persistence
    func createPersistenceStore() -> URL {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = url[0].appendingPathComponent("Persons.json")
        return fileURL
    }
    
    func saveToPersistenceStore() {
        do {
            let data = try JSONEncoder().encode(persons)
            try data.write(to: createPersistenceStore())
        } catch {
            print("")
        }
    }
    
    func loadFromPersistenceStore() {
        do {
            let data = try Data(contentsOf: createPersistenceStore())
            persons = try JSONDecoder().decode([Person].self, from: data)
        } catch {
            print("")
        }
    }
}
