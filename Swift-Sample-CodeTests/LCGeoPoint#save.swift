//
//  LCGeoPoint.swift
//  Swift-Sample-Code
//
//  Created by WuJun on 6/30/16.
//  Copyright © 2016 leancloud. All rights reserved.
//

import XCTest
import LeanCloud

class LCGeoPoint_save: BaseTestCase {
    
    func testLCGeoPointSave() {
        await("LCGeoPoint save") { (exception) in
            let leancloudOffice  = LCGeoPoint(latitude: 39.9, longitude: 116.4)
            let todo = LCObject(className: "Todo")
            todo.set("whereCreated", object: todo)
            todo.save {(savedResult) in
                XCTAssertTrue(savedResult.isSuccess)
                exception.fulfill()
            }
        }

    }
    
}
