//
//  CharacterFeedTests.swift
//  RMAppTests
//
//  Created by sunny on 2022/11/10.
//

import XCTest
@testable import RMApp

final class CharacterFeedTests: XCTestCase {

    //test character feed view model
    func testLoadPage() async throws {
        let feed = CharacterFeed();
        let _ = feed.loadCharacter(page: 1);
       
        //there is a async in load data, put assert in a queue, so the characterItems has correct count
        Task{
            DispatchQueue.main.async {
                XCTAssert(feed.characterItems.count > 0, "feed character items is empty")
            }
        }
    }
}
