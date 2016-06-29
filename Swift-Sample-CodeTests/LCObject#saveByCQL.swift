//
//  LCObject#saveByCQL.swift
//  Swift-Sample-Code
//
//  Created by WuJun on 6/28/16.
//  Copyright © 2016 leancloud. All rights reserved.
//

import XCTest
import LeanCloud

class LCObject_saveByCQL: BaseTestCase {
    func testSaveTodoFolder() {
        await("Save TodoFolder") { (exception) in
            LeanCloud.CQLClient.execute("insert into TodoFolder(name, priority) values('工作', 1)") { (result) in
                if(result.isFailure){
                    print(result.error)
                } else {
                    if(result.objects.count > 0){
                        let todoFolder = result.objects[0]
                        print("objectId",todoFolder.objectId?.value)
                        XCTAssertNotNil(todoFolder.objectId)
                        exception.fulfill()
                    }
                }
            }
        }
    }
}
