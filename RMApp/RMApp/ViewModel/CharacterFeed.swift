//
//  CharacterFeed.swift
//  RMApp
//
//  Created by westin on 2022/11/9.
//

import Foundation

class CharacterFeed : ObservableObject {
    @Published var state: ViewState = ViewState.idle
    var characterItems = [Character]()
    private(set) var page: Int = 1
    
    /// load data by page, starts from 1
    /// - Parameter page: 1 ~ n
    func loadCharacter(page: Int = 1) {
        state = .loading;
        Task {
            let result = await CharacterFeedService.getAllCharacters(request: CharacterRequest.init(page: page))
            DispatchQueue.main.async {
                switch result {
                case let .success(response):
                    self.characterItems.append(contentsOf: response.results ?? []);
                    self.state = .success
                case let .failure(error):
                    self.state = .error(error)
                }
            }            
        }
    }
}

