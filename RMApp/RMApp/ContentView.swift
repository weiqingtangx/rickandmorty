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
            TabItemView(title:"Characters", image: "house")
            TabItemView(title:"Characters", image: "house")
        };
    }
}

struct TabItemView: View {
    var title: String
    var image: String
    
    var body: some View {
        NavigationStack {
                HomeView()
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
