//
//  UtilityTests.swift
//  CoreData with Multiple Relation ShipsTests
//
//  Created by Mohd Imran on 3/5/18.
//  Copyright © 2018 Mohd Imran. All rights reserved.
//

import XCTest
@testable import CoreData_with_Multiple_Relation_Ships
class UtilityTests: XCTestCase {
    
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
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testisValidEmail() -> Void {
        
        XCTAssertFalse(Utility.isValidEmail(withEmail: "hello"))
        XCTAssertTrue(Utility.isValidEmail(withEmail: "hello2@gmail.com"))
        
    }
    
    func testisValidLogin() -> Void {
        
        
        XCTAssertTrue(Utility.isValidLogin(withEmail: "test@example.com", withPassword: "123456"))
        XCTAssertFalse(Utility.isValidLogin(withEmail: "test1@example.com", withPassword: "123456"))
        //XCTAssertFalse(Utility.isValidLogin(withEmail: "test1@example.", withPassword: "123456"))
    }
    
}
