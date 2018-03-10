//
//  BoardgameRecoTests.swift
//  BoardgameRecoTests
//
//  Created by 原野誉大 on 2018/03/10.
//  Copyright © 2018年 原野誉大. All rights reserved.
//

import XCTest
@testable import BoardgameReco

class BoardgameRecoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let model = Model(path: "boardgame")
        let boardgame = model.getBoardgames().value
        
        XCTAssertEqual(boardgame[0].name, "Agricola")
        XCTAssertEqual(boardgame[0].minPlayers, 1)
        XCTAssertEqual(boardgame[0].maxPlayers, 5)
        XCTAssertEqual(boardgame[0].playingTime, 150)
        XCTAssertEqual(boardgame[0].image_url,"https://cf.geekdo-images.com/original/img/L-UBO3rBOmvIrZHZLSXOypyAUPw=/0x0/pic259085.jpg")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
