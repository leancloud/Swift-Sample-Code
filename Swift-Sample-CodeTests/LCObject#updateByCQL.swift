//
//  LCObject#updateByCQL.swift
//  Swift-Sample-Code
//
//  Created by WuJun on 6/28/16.
//  Copyright © 2016 leancloud. All rights reserved.
//

import XCTest
import LeanCloud

class LCObject_updateByCQL: BaseTestCase {
    
    func testUpdateByCQL() {
        await("update by CQL") { (exception) in
            LeanCloud.CQLClient.execute("update TodoFolder set name='家庭' where objectId='575d2c692e958a0059ca3558'", completion: { (result) in
                XCTAssertNil(result.error)
                if(result.isSuccess){
                    // 成功执行了 CQL
                }
                exception.fulfill()
            })
        }
    }
    
    
}
