//
//  LCObject#batchOperation.swift
//  Swift-Sample-Code
//
//  Created by WuJun on 6/28/16.
//  Copyright © 2016 leancloud. All rights reserved.
//

import XCTest
import LeanCloud

class LCObject_batchOperation: BaseTestCase {
    func testSetArray() {
        await("batch operation") { (exception) in
            let todo1 = LCObject(className:"Todo")
            todo1.set("title", object: "review 代码")
            
            let todo2 = LCObject(className:"Todo")
            todo2.set("title", object: "发布单元测试报告")
            
            let todo3 = LCObject(className:"Todo")
            todo3.set("title", object: "参加线下活动")
        }
    }
    
}
