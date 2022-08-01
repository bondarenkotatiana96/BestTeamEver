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
    
    var body: some View {
        NavigationView {
            VStack {
            Text("Coding Cats")
                .font(Font.custom("RampartOne-Regular", size: 30))
                .bold()
                NavigationLink {
                    DetailView(person: viewModel.persons[0], personViewModel: viewModel)
                } label: {
                    Card(text: "\(viewModel.persons[0].name)", imageName: "\(viewModel.persons[0].image)", height: 210, width: 170)
                }
                LazyVGrid(columns: columns, alignment: .center) {
                    ForEach(viewModel.persons[1...viewModel.persons.count-1]) { person in
                        NavigationLink {
                            DetailView(person: person, personViewModel: viewModel)
                        } label: {
                            Card(text: "\(person.name)", imageName: "\(person.image)", height: 150, width: 150)
                        }
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

struct Card: View {
    var text: String
    var imageName: String
    var height: CGFloat
    var width: CGFloat
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                .frame(width: width, height: height)
            Text(text)
        }
    }
}
