//
//  Person.swift
//  BestTeamEver
//
//  Created by Tatiana Bondarenko on 8/1/22.
//

import Foundation

struct Person: Identifiable, Codable {
    let name: String
    let title: String
    let image: String
    let bio: String
    var id = UUID()
}
