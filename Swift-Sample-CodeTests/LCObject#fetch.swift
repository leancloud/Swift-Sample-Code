//
//  LCObject#fetch.swift
//  Swift-Sample-Code
//
//  Created by WuJun on 6/28/16.
//  Copyright © 2016 leancloud. All rights reserved.
//

import XCTest
import LeanCloud

class LCObject_fetch: BaseTestCase {
    
    func testfetchByObjectId() {
        await("fetch by objectId") { (exception) in
            let todo = LCObject(className: "Todo", objectId: "575cf743a3413100614d7d75")
            
            todo.fetch({ (result ) in
                XCTAssertTrue(result.isSuccess)
                if(result.error != nil){
                    print(result.error)
                }
                // 读取 title 属性
                let title = todo.get("title")
                // 读取 content 属性
                let content = todo.get("content")
                 exception.fulfill()
            })
        }
    }
    
}
