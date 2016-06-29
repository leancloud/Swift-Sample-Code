//
//  LCObject#atomicOprationIncrement.swift
//  Swift-Sample-Code
//
//  Created by WuJun on 6/28/16.
//  Copyright © 2016 leancloud. All rights reserved.
//

import XCTest
import LeanCloud

class LCObject_atomicOprationIncrement: BaseTestCase {
    
    func testExample() {
        await("atomic opration increment") { (exception) in
            let todo = LCObject(className: "Todo", objectId: "575cf743a3413100614d7d75")
            todo.set("views", object: 50)
            todo.save({ (saveResult) in
                todo.increase("views", by: LCNumber(1));
                todo.save({ (increaseResult) in
                    XCTAssertNil(increaseResult.error)
                    if(increaseResult.isSuccess){
                        print(todo.get("views"))
                    }
                    exception.fulfill()
                })
            })
        }
    }
    
}
