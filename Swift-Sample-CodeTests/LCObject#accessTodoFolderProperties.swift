//
//  LCObject#accessTodoFolderProperties.swift
//  Swift-Sample-Code
//
//  Created by WuJun on 6/28/16.
//  Copyright © 2016 leancloud. All rights reserved.
//

import XCTest
import LeanCloud

class LCObject_accessTodoFolderProperties: BaseTestCase {
    
    func testGetObjectIdInCallbak() {
        await("access TodoFolder properties") { (exception) in
            let todo = LCObject(className: "Todo")
            todo.set("title", object: "工程师周会")
            todo.set("content", object: "每周工程师会议，周一下午2点")
            todo.set("location", object: "会议室")
            
            todo.save { (result) in
                XCTAssertNotNil(todo.objectId)
                if(result.isSuccess){
                    print(todo.objectId)
                } else {
                    // 失败的话，请检查网络环境以及 SDK 配置是否正确
                }
                exception.fulfill()
            }
        }
    }

}
