//
//  CharacterFeedService.swift
//  RMApp
//
//  Created by westin on 2022/11/9.
//

import Foundation

class CharacterRequest: Codable {
    var page: Int
    
    init(page: Int) {
        self.page = page
    }
}

class CharacterResponse: Codable {
    var info : Info?
    var results : [Character]?
}

struct CharacterFeedService {
    
    /// get character list from server side
    /// each page 20 characters
    /// - Parameter request: page starts from 1
    /// - Returns: CharacterResponse or Error occured
    static func getAllCharacters(request: CharacterRequest) async -> Result<CharacterResponse, Error> {
        if(request.page < 1) {
            //although api support less 1, but i think we should protect it in frontend side
            //may be need to log to file in case we need debug by log
            print("CharacterFeedService#Error: page should not smaller than 1")
            return .failure(CustomError.noData)
        }
               
        //assembly a new url
        let url = "\(BaseURL)/character/?page=\(request.page)"
        
        do {
            let (data, _) = try await URLSession.shared.data(from: URL(string: url)!)
            let response = try JSONDecoder().decode(CharacterResponse.self, from: data)
            return .success(response);
        } catch let error {
            print("CharacterFeedService#Error: \(error.localizedDescription)")
            return .failure(CustomError.parseError);
        }
    }
}
