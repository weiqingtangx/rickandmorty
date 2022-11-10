//
//  HomeView.swift
//  RMApp
//
//  Created by westin on 2022/11/9.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var characterFeed = CharacterFeed()
    @State var searchText = ""
    
    var body: some View {
        let filterFeed = self.characterFeed.filter {
            self.searchText.isEmpty ? true : $0.name!.lowercased().contains(self.searchText.lowercased())};
        List {
            ForEach(filterFeed, id: \.id) { character in
                VStack {
                    ZStack {
                        CharacterView(character: character)
                        NavigationLink(destination: CharacterDetailView(character: character)) {
                            EmptyView()
                        }.buttonStyle(PlainButtonStyle())
                    }
                    Spacer()
                }
            }            
        }.searchable(text: $searchText)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

