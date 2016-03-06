//
//  SwiftyRegexTests.swift
//  SwiftyRegexTests
//
//  Created by Tomek on 06.03.2016.
//  Copyright © 2016 Tomek Cejner. All rights reserved.
//

import XCTest
@testable import SwiftyRegex

class SwiftyRegexTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testMatching() {
        let rex = Regex("\\d+")
        XCTAssertTrue(rex.test("1234"))
    }
    
    func testMatches() {
        let rex = Regex("\\d+")
        let matches = rex.matches("123 456 789")
        XCTAssertEqual(matches.count, 3)
        XCTAssertEqual(matches[0], "123")
        XCTAssertEqual(matches[1], "456")
        XCTAssertEqual(matches[2], "789")
    }
    
    func testCaptureGroups() {
        let rex = Regex("(\\d{2})-(\\d{3})")
        XCTAssertTrue(rex.test("31-234"))
        let groups = rex.captures("31-234")
        XCTAssertEqual(groups[1], "31")
        XCTAssertEqual(groups[2], "234")
    }
    
    func testOperator() {
        XCTAssertTrue("12345" =~ "\\d+")
    }
    
}
