//
//  CharacterView.swift
//  RMApp
//
//  Created by westin on 2022/11/9.
//

import SwiftUI
import SDWebImageSwiftUI

struct CharacterView: View {
    var character : Character?
 
    var body: some View {
        let size = UIScreen.main.bounds.size.width * 0.4;
        HStack {
            WebImage(url: URL(string: character?.image ?? ""))
                .resizable()
                .scaledToFill().frame(width: size, height: size)
            VStack(alignment: .leading, spacing: 16) {
                Text(character?.name ?? "Not nameable character").font(.title3).bold()
                Text(character?.status ?? "Unknown").font(.subheadline)
                Text("Seen in \(character?.episode?.count ?? 0) episodes")
                   .font(.subheadline)
                   .foregroundColor(.gray)
            }
        }
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView(character: Character())
    }
}
