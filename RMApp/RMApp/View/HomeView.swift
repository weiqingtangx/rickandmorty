//
//  HomeView.swift
//  RMApp
//
//  Created by westin on 2022/11/9.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var characterFeed = CharacterFeed()
    
    init() {
        self.characterFeed.loadCharacter()
    }
    
    var body: some View {
        //handle different state of CharacterFeed ViewModel
        switch self.characterFeed.state {
        case .idle: IdleView()
        case .loading: LoadingView();
        case .success: SuccessView(characterItems: self.characterFeed.characterItems);
        case .error(let err): ErrorView(characterItems: self.characterFeed.characterItems, error: err);
        }
    }
}

struct IdleView: View {
    var body: some View {
        Text("Idle");
    }
}

struct LoadingView: View {
    var body: some View {
        Text("Loading...");
    }
}

struct SuccessView: View {
    var characterItems: [Character]
    @State var searchText = ""
    
    var body: some View {
        let filterFeed = self.characterItems.filter {
            self.searchText.isEmpty ? true : $0.name!.lowercased().contains(self.searchText.lowercased())};
        List {
            ForEach(filterFeed, id: \.id) { character in
                ZStack {
                    CharacterView(character: character)
                    NavigationLink(destination: CharacterDetailView(character: character)) {
                        EmptyView()
                    }.buttonStyle(PlainButtonStyle())
                }
            }
        }.searchable(text: $searchText)
    }
}

struct ErrorView: View {
    var characterItems: [Character]
    var error: Error
    
    var body: some View {
        if(self.characterItems.count == 0) {
            //show custom error
            Text("Error:\(error.localizedDescription)");
            
            //may be we should add a retry button
        }
        //else we have data, do nothing here
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

