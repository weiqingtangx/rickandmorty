//
//  CharacterDetailView.swift
//  RMApp
//
//  Created by westin on 2022/11/9.
//

import SwiftUI
import SDWebImageSwiftUI

struct PhotoImage: View {
    var url : String
    
    var body: some View {
        WebImage(url: URL(string: url))
        .resizable()
    }
}

struct CharacterDetailView: View {
    var character : Character?
   
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                PhotoImage(url: character?.image ?? "")
                    .frame(width: 300, height: 300)
                VStack(alignment: .center, spacing: 16) {
                    Text(character?.name ?? "Unknown").font(.title3).bold()
                    Text(character?.status ?? "Unknown").font(.subheadline)
                    Text(character?.species ?? "Unknown").font(.subheadline)
                    Text(character?.gender ?? "Unknown").font(.subheadline)
                    Text(character?.location?.name ?? "Unknown").font(.subheadline)
                    Text("Seen in \(character?.episode?.count ?? 0) episodes").font(.subheadline)
                       
                }
            }
        }
    }
}
