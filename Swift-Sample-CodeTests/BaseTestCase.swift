//
//  BaseTestCase.swift
//  Swift-Sample-Code
//
//  Created by WuJun on 6/22/16.
//  Copyright © 2016 leancloud. All rights reserved.
//

import XCTest
import LeanCloud

class BaseTestCase: XCTestCase {
    func await(description: String, asynchronousAction: (XCTestExpectation) -> Void) {
        let expectation = expectationWithDescription(description)
        dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            asynchronousAction(expectation)
        })
        waitForExpectationsWithTimeout(10) { error in
            XCTAssertNil(error)
        }
    }
    override func setUp() {
        super.setUp()
        LeanCloud.initialize(applicationID: "uay57kigwe0b6f5n0e1d4z4xhydsml3dor24bzwvzr57wdap", applicationKey: "kfgz7jjfsk55r5a8a3y4ttd3je1ko11bkibcikonk32oozww")
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
}
