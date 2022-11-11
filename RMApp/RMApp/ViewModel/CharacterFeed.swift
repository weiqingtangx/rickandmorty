//
//  CharacterFeed.swift
//  RMApp
//
//  Created by westin on 2022/11/9.
//

import Foundation

class CharacterFeed : ObservableObject, RandomAccessCollection {
    var startIndex: Int{ characterItems.startIndex }
    var endIndex: Int{ characterItems.endIndex }
    
    var characterItems = [Character]()
    var page: Int = 1;
    @Published var state: ViewState = ViewState.idle;
    
    subscript(position: Int) -> Character {
        return characterItems[position]
    }
    
    init() {
        Task {await loadData(page: page)}
    }
    
    
    /// load data by page, starts from 1
    /// - Parameter page: 1 ~ n
    func loadData(page: Int) async {
        state = .loading;
        let result = await CharacterFeedService.getAllCharacters(request: CharacterRequest.init(page: page));
        
        DispatchQueue.main.async {
            switch result {
            case let .success(characters):
                self.characterItems = characters.results ?? []
                self.state = .success
            case let .failure(error):
                self.state = .error(error)
            }
        }
    }
}

