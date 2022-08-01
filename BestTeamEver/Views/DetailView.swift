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
        VStack(spacing: 20) {
            Image("\(person.image)")
            Text("\(person.name)")
                .font(.title)
                .bold()
            Text("\(person.title)")
                .font(.title2)
                .padding(.bottom)
            Text("\(person.bio)")
                .font(.body)
                .padding(.horizontal)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(person: Person(name: "Name", title: "Title", image: "", bio: "......"), personViewModel: PersonListViewModel())
    }
}
