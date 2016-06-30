//
//  Pointer#save.swift
//  Swift-Sample-Code
//
//  Created by WuJun on 6/30/16.
//  Copyright © 2016 leancloud. All rights reserved.
//

import XCTest
import LeanCloud

class Pointer_save: BaseTestCase {
    
    func testSavePointer() {
        // 新建一条留言
        let comment = LCObject(className: "Comment")
        // 如果点了赞就是 1，而点了不喜欢则为 -1，没有做任何操作就是默认的 0
        comment.set("like", object: 1)
        // 留言的内容
        comment.set("content", object: "这个太赞了！楼主，我也要这些游戏，咱们团购么？")
        
        // 假设已知了被分享的该 TodoFolder 的 objectId 是 5590cdfde4b00f7adb5860c8
        let todoFolder = LCObject(className: "TodoFolder", objectId: "5590cdfde4b00f7adb5860c8")
        comment.set("targetTodoFolder", object: todoFolder)
        // 以上代码的执行结果是在 comment 对象上有一个名为 targetTodoFolder 属性，它是一个 Pointer 类型，指向 objectId 为 5590cdfde4b00f7adb5860c8 的 TodoFolder
        comment.save {}
    }
    
}
