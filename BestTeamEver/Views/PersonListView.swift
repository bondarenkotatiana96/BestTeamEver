//
//  PersonListView.swift
//  BestTeamEver
//
//  Created by Tatiana Bondarenko on 8/1/22.
//

import SwiftUI

struct PersonListView: View {
    
    @ObservedObject var viewModel = PersonListViewModel()
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    @State private var showingSheet = false
    @State private var isPresentingPerson: Person? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Coding Cats")
                    .font(Font.custom("BlackOpsOne-Regular", size: 33))
                    .bold()
                    .foregroundColor(Color.cyan)
                    
                    NavigationLink {
                        DetailView(person: viewModel.persons[0], personViewModel: viewModel)
                    } label: {
                        Card(text: "\(viewModel.persons[0].name)", imageName: "\(viewModel.persons[0].image)", height: 190, width: 160)
                    }
                
                    LazyVGrid(columns: columns, alignment: .center) {
                        ForEach(viewModel.persons[1...viewModel.persons.count-1]) { person in
                            Button {
                                isPresentingPerson = person
                                showingSheet.toggle()
                                SoundManager.instance.playSound()
                            } label: {
                                Card(text: "\(person.name)", imageName: "\(person.image)", height: 150, width: 140)
                            }
                        }
                        .sheet(item: $isPresentingPerson) { person in
                            DetailView(person: person, personViewModel: viewModel)
                        }
                    }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            viewModel.loadFromPersistenceStore()
        }
    }
}

struct PersonListView_Previews: PreviewProvider {
    static var previews: some View {
        PersonListView()
    }
}
