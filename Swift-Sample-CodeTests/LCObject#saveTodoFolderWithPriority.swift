//
//  LCObject#saveTodoFolderWithPriority.swift
//  Swift-Sample-Code
//
//  Created by WuJun on 6/28/16.
//  Copyright © 2016 leancloud. All rights reserved.
//

import XCTest
import LeanCloud

class LCObject_saveTodoFolderWithPriority: BaseTestCase {
    
    func testSaveTodoFolderWithPriority() {
        await("Save Todo with priority") { (exception) in
            // className 参数对应控制台中的 Class Name
            let todoFolder = LCObject(className: "TodoFolder")
            todoFolder.set("name", object:"工作")
            todoFolder.set("priority", object: 1)
            
            todoFolder.save { result in
                XCTAssertTrue(result.isSuccess)
                exception.fulfill()
            }
        }
    }
}
