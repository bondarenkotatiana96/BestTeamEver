//
//  PersonListViewModel.swift
//  BestTeamEver
//
//  Created by Tatiana Bondarenko on 8/1/22.
//

import Foundation

class PersonListViewModel: ObservableObject {
    
    @Published var persons: [Person] = [
        Person(name: "Tiffany", title: "CEO/Project Manager", image: "tiffany", bio: "Prior to becoming an iOS developer, Tiffany spent 14 years in education as a teacher and a learning design specialist with companies such as Amazon and LeapFrog. In 2021, she made the transition to follow her passion of developing and graduated from the DevMountain iOS program. She worked as a full-time software engineer at Fetch Rewards until joining us here at Hackbright Academy."),
        Person(name: "Lily", title: "Senior iOS Developer", image: "lily", bio: "First generation Asian American looking to build long-lasting community connections and a career change. Lily is a driven individual who wants to create user-friendly interfaces with Swift. Her interest surfaced in college when she learned about computational work for the sciences. She couldn't believe that the human genome had been fully sequenced at her alma mater. Eventually, her interest shifted towards iOS Development.  In her free time, Lily enjoys binging movie series, playing with her kitten, and playing Pokémon United."),
        Person(name: "Niwei", title: "Senior iOS Developer", image: "niwei", bio: "Accountant-turned-developer, and a passionate coder interested in iOS applications development."),
        Person(name: "Sasha", title: "Senior iOS Developer", image: "sasha", bio: "My name is Sasha. I’ve been working last year as a student transfer assistant and at the same time I was taking CS classes in the college.  Before moving to the US I was working in IT sales. I have kids and live in Berkeley.  May the Furrrce be with you!"),
        Person(name: "Tatiana", title: "Senior iOS Developer", image: "tatiana", bio: "Tatiana is a Student iOS Developer at Hackbright Academy. Her love for coding started at 14 when she took Computer Science classes in High School. She began her career in the tech industry as a Project Manager. After moving to the US she taught herself Web Development and is now doing an amazing job making iOS apps.  She also has a YouTube channel where she encourages more people to join the industry.")
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
