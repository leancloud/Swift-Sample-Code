//
//  LCObject#saveTodoWithLoaction.swift
//  Swift-Sample-Code
//
//  Created by WuJun on 6/28/16.
//  Copyright © 2016 leancloud. All rights reserved.
//

import XCTest
import LeanCloud

class LCObject_saveTodoWithLoaction: BaseTestCase {
    
    func testSaveTodoWithLoaction(){
        await("save Todo with location") { (exception) in
            // className 参数对应控制台中的 Class Name
            let todo = LCObject(className: "Todo")
            todo.set("title", value:"工作" as LCString)
            todo.set("content", object: "每周工程师会议，周一下午2点")
            // 设置 location 的值为「会议室」
            todo.set("location", object: "会议室")
            
            todo.save { result in
                XCTAssertTrue(result.isSuccess)
                exception.fulfill()
            }
        }
    }    
}
