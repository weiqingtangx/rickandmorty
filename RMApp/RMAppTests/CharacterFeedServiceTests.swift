//
//  CharacterFeedServiceTests.swift
//  RMAppTests
//
//  Created by westin on 2022/11/10.
//

import XCTest
@testable import RMApp

final class CharacterFeedServiceTests: XCTestCase {
    
    //test serview
    func testGetAllCharactersSuccess() async throws {
        let result = await CharacterFeedService.getAllCharacters(request: CharacterRequest.init(page: 1))
        switch result {
        case .success(_): XCTAssertTrue(true);
        case .failure(_): XCTAssertTrue(false);
        }
    }
    
    func testGetAllCharactersError() async throws {
        //error page -1
        let result = await CharacterFeedService.getAllCharacters(request: CharacterRequest.init(page: -1))
        switch result {
        case .success(_): XCTAssertTrue(false);
        case .failure(_): XCTAssertTrue(true);
        }
    }
    
    func testGetAllCharactersOutOfPageError() async throws {
        //page 100
        let result = await CharacterFeedService.getAllCharacters(request: CharacterRequest.init(page: 100))
        switch result {
        case .success(_): XCTAssertTrue(true);
        case .failure(_): XCTAssertTrue(false);
        }
    }
}

