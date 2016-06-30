//
//  LCUser#signUp.swift
//  Swift-Sample-Code
//
//  Created by WuJun on 6/30/16.
//  Copyright © 2016 leancloud. All rights reserved.
//

import XCTest
import LeanCloud

class LCUser_signUp: BaseTestCase {

    func testSignUp(){
        let randomUser = LCUser()
        randomUser.username = LCString.init(self.randomAlphaNumericString(8))
        randomUser.password = LCString.init("leancloud")
        randomUser.signUp()
        print(randomUser.objectId?.value)
        XCTAssertNotNil(randomUser.objectId)
    }
}