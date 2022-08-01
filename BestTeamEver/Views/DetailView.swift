//
//  DetailView.swift
//  BestTeamEver
//
//  Created by Tatiana Bondarenko on 8/1/22.
//

import SwiftUI

struct DetailView: View {
    
    var person: Person
    @ObservedObject var personViewModel: PersonListViewModel
    
    var body: some View {
        Text("\(person.title)")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(person: Person(name: "Name", title: "Title", image: "", bio: "......"), personViewModel: PersonListViewModel())
    }
}
