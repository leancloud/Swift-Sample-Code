//
//  LCRelation#save.swift
//  Swift-Sample-Code
//
//  Created by WuJun on 6/30/16.
//  Copyright © 2016 leancloud. All rights reserved.
//

import XCTest
import LeanCloud

class LCRelation_save: BaseTestCase {
    
    
    func testSaveRelation() {
        // 以下代码需要同步执行
        // 新建一个 TodoFolder 对象
        let todoFolder = LCObject(className: "TodoFolder")
        todoFolder.set("name", object: "工作")
        todoFolder.set("priority", object: 1)
        todoFolder.save()
        
        // 新建 3 个 Todo 对象
        let todo1 = LCObject(className: "Todo")
        todo1.set("title", object: "工程师周会")
        todo1.set("content", object: "每周工程师会议，周一下午2点")
        todo1.set("location", object: "会议室")
        todo1.save()
        
        let todo2 = LCObject(className: "Todo")
        todo2.set("title", object: "维护文档")
        todo2.set("content", object: "每天 16：00 到 18：00 定期维护文档")
        todo2.set("location", object: "当前工位")
        todo1.save()
        
        let todo3 = LCObject(className: "Todo")
        todo3.set("title", object: "发布 SDK")
        todo3.set("content", object: "每周一下午 15：00")
        todo3.set("location", object: "SA 工位")
        todo1.save()
        
        // 使用接口 insertRelation 建立 todoFolder 与 todo1,todo2,todo3 的一对多的关系
        todoFolder.insertRelation("containedTodos", object: todo1)
        todoFolder.insertRelation("containedTodos", object: todo2)
        todoFolder.insertRelation("containedTodos", object: todo3)
        
        todoFolder.save()
        
        // 保存完毕之后，读取 LCRelation 对象
        let relation : LCRelation = todoFolder.get("containedTodos")
        
    }
}
