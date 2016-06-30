//
//  LCUser#logIn.swift
//  Swift-Sample-Code
//
//  Created by WuJun on 6/30/16.
//  Copyright © 2016 leancloud. All rights reserved.
//

import XCTest
import LeanCloud

class LCUser_logIn: BaseTestCase {
    var testUser:LCUser = LCUser()
    var testUsername : String = ""
    override func setUp() {
        super.setUp()
        
        self.testUsername = self.randomAlphaNumericString(8)
        self.testUser.username = LCString.init(self.testUsername)
        self.testUser.password = LCString.init("leancloud")
        self.testUser.signUp()
        print(self.testUsername)
    }
    
    func testUserLogIn() {
        await("user logIn") { (exception) in
            print("before login",self.testUsername)
            XCTAssert(true)
            exception.fulfill()
        }
    }
    
}
