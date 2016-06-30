//
//  Query#containsIn.swift
//  Swift-Sample-Code
//
//  Created by WuJun on 6/30/16.
//  Copyright © 2016 leancloud. All rights reserved.
//

import XCTest
import LeanCloud

class Query_containsIn: BaseTestCase {
    
    func testContainsIn() {
        await("Save TodoFolder") { (exception) in
            let query = LeanCloud.Query(className: "Todo")
            let priorities: LCArray = [LCNumber(1), LCNumber(2), LCNumber(3)]

            query.whereKey("priority", Query.Constraint.ContainedIn(array: priorities))
            
            query.find({ (result) in
                for todo in result.objects! {
                    print(todo)
                }
                exception.fulfill()
            })
        }
    }
    
}
