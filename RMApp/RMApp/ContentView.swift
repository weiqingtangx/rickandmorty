//
//  ContentView.swift
//  RMApp
//
//  Created by westin on 2022/11/9.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TabItemView(title:"Characters", image: "house", view: AnyView(HomeView()))
        };
    }
}

struct TabItemView: View {
    var title: String
    var image: String
    var view: AnyView
    
    var body: some View {
        NavigationStack {
                view
            .navigationTitle(title)
        }
        .tabItem {
            Label(title, systemImage: image)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
