//
//  LCObject#updateTodoLacation.swift
//  Swift-Sample-Code
//
//  Created by WuJun on 6/28/16.
//  Copyright © 2016 leancloud. All rights reserved.
//

import XCTest
import LeanCloud

class LCObject_updateTodoLacation: BaseTestCase {
    
    func testUpdateLocation(){
        await("access TodoFolder properties") { (exception) in
            let todo = LCObject(className: "Todo", objectId: "575cf743a3413100614d7d75")
            
            todo.set("content", object: "每周工程师会议，本周改为周三下午3点半。")
            
            todo.save({ (result) in
                XCTAssertNotNil(todo.get("content"))
                if(result.isSuccess){
                    print("保存成功")
                }
                exception.fulfill()
            })
        }
    }
}
