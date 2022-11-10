//
//  CharacterFeedServiceTests.swift
//  RMAppTests
//
//  Created by westin on 2022/11/10.
//

import XCTest
@testable import RMApp

final class CharacterFeedServiceTests: XCTestCase {

    func testGetAllCharactersSuccess() throws {
        CharacterFeedService.getAllCharacters(request: CharacterRequest.init(page: 1)) {  result in
            switch result {
            case .success(_): XCTAssertTrue(true);
            case .failure(_): XCTAssertTrue(false);
            }
        }
    }
    
    func testGetAllCharactersError() throws {
        //error page -1
        CharacterFeedService.getAllCharacters(request: CharacterRequest.init(page: -1)) {  result in
            switch result {
            case .success(_): XCTAssertTrue(false);
            case .failure(_): XCTAssertTrue(true);
            }
        }
    }
}

