//
//  HomeView.swift
//  RMApp
//
//  Created by westin on 2022/11/9.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var characterFeed = CharacterFeed()
    
    var body: some View {
        //handle different state of CharacterFeed ViewModel
        switch self.characterFeed.state {
        case .idle: IdleView()
        case .loading: LoadingView();
        case .success: SuccessView(characterFeed: self.characterFeed);
        case .error: ErrorView(characterFeed: self.characterFeed);
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
    var characterFeed: CharacterFeed
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
                }
            }
        }.searchable(text: $searchText)
    }
}

struct ErrorView: View {
    var characterFeed: CharacterFeed
    
    var body: some View {
        if(self.characterFeed.count == 0) {
            Text("Error");
        }
        //else we have data, do nothing here
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

