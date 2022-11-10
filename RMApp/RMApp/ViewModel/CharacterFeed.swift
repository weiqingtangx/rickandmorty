//
//  CharacterFeed.swift
//  RMApp
//
//  Created by westin on 2022/11/9.
//

import Foundation

enum ViewState {
    case idle
    case loading
    case success
    case error(Error)
}

class CharacterFeed : ObservableObject, RandomAccessCollection {
    @Published var characterItems = [Character]()
    
    var startIndex: Int{ characterItems.startIndex }
    var endIndex: Int{ characterItems.endIndex }
    var page: Int = 0;
    var state: ViewState = ViewState.idle;
    
    subscript(position: Int) -> Character {
        return characterItems[position]
    }
    
    init(){
        state = .loading;
        let req = CharacterRequest.init(page: 1);
        CharacterFeedService.getAllCharacters(request: req) { [weak self] result in
            guard let self = self else { return; }
            DispatchQueue.main.async {
                switch result {
                case let .success(characters):
                    self.characterItems = characters.results ?? []
                    self.state = .success
                case let .failure(error):
                    self.characterItems = []
                    self.state = .error(error)
                }
            }
        }
    }
}

