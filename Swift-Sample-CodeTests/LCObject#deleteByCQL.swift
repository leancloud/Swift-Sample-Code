//
//  LCObject#deleteByCQL.swift
//  Swift-Sample-Code
//
//  Created by WuJun on 6/29/16.
//  Copyright © 2016 leancloud. All rights reserved.
//

import XCTest
import LeanCloud

class LCObject_deleteByCQL: BaseTestCase {
    var objectId:String = ""
    override func setUp() {
        super.setUp()
        await("prepare objectId for delete test case") { (exception) in
            LeanCloud.CQLClient.execute("insert into Todo(title, content) values('review 代码', '每周例行review 代码')") { (result) in
                if(result.isSuccess){
                    // 删除成功
                } else {
                    // 删除失败，打印错误信息
                    print(result.error?.reason)
                }
                if(result.objects.count > 0){
                    self.objectId = (result.objects[0].objectId?.value)!
                }
                exception.fulfill()
            }
        }
    }
    func testDeteleByCQL() {
        await("delete by cql") { (exception) in
            let cql = String(format: "delete from Todo where objectId='%@'", self.objectId)
            LeanCloud.CQLClient.execute(cql) { (result) in
                XCTAssertTrue(result.isSuccess)
                if(result.isSuccess){
                    // 删除成功
                } else {
                    // 删除失败，打印错误信息
                    print(result.error?.reason)
                }
                exception.fulfill()
            }
        }
    }
    
    
}
