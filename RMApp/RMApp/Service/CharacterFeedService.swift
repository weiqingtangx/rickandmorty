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

class CharactersResponse: Codable {
    var info : Info?
    var results : [Character]?
}

struct CharacterFeedService {
    
    /// request all characters from server side
    /// - Parameters:
    ///   - request: request params
    ///   - completion: failure with error or success with response
    static func getAllCharacters(request: CharacterRequest, completion: @escaping (Result<CharactersResponse, Error>) -> Void) {
       
        //assembly a new url
        let url = "\(BaseURL)/character/?page=\(request.page)"
        
        URLSession.shared.dataTask(with: URL(string: url)!){ data, _, error in
            guard error == nil else {
                print("CharacterFeedService#Error: \(error?.localizedDescription ?? "Unknown error occured")")
                completion(.failure(CustomError.noResponse))
                return
            }
            
            guard let data = data else {
                print("CharacterFeedService#Error: \(error?.localizedDescription ?? "Unknown error occured")")
                completion(.failure(CustomError.noData))
                return
            }
            
            do {
                let response = try JSONDecoder().decode(CharactersResponse.self, from: data)
                completion(.success(response))
            } catch {
                print("CharacterFeedService#Error: \(error.localizedDescription)")
                completion(.failure(CustomError.parseError))
                return
            }
        }.resume()
    }
}
