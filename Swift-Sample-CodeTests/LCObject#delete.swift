//
//  LCObject#delete.swift
//  Swift-Sample-Code
//
//  Created by WuJun on 6/28/16.
//  Copyright © 2016 leancloud. All rights reserved.
//

import XCTest
import LeanCloud

class LCObject_delete: BaseTestCase {
    var objectId : String = ""
    override func setUp() {
        super.setUp()
        await("prepare objectId for delete test case") { (exception) in
            let todo = LCObject(className:"Todo")
            todo.set("title", object: "review 代码")
            todo.save({ (saveResult) in
                self.objectId = (todo.objectId?.value)!
                exception.fulfill()
            })
        }
        
    }
    func  testDelete() {
        await("delete test case") { (exception) in
            let todo = LCObject(className: "Todo", objectId: self.objectId)
            todo.delete { (result) in
                XCTAssertTrue(result.isSuccess)
                if(result.isSuccess){
                    // 根据 result.isSuccess 可以判断是否删除成功
                } else {
                    if (result.error != nil){
                        print(result.error?.reason)
                        // 如果删除失败，可以查看是否当前正确的使用了 ACL
                    }
                }
                exception.fulfill()
            }
        }
    }
}
