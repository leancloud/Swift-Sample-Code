//
//  LCObject#setArray.swift
//  Swift-Sample-Code
//
//  Created by WuJun on 6/28/16.
//  Copyright © 2016 leancloud. All rights reserved.
//

import XCTest
import LeanCloud

class LCObject_setArray: BaseTestCase {
    
    func testSetArray() {
        await("set array") { (exception) in
            let renminder1 = self.getDateWithDateString("2015-11-11 07:10:00")
            let renminder2 = self.getDateWithDateString("2015-11-11 07:20:00")
            let renminder3 = self.getDateWithDateString("2015-11-11 07:30:00")
            
            let reminders = LCArray(arrayLiteral: renminder1,renminder2,renminder3)
            
            let todo = LCObject(className: "Todo")
            todo.set("reminders", value: reminders)
            
            todo.save({ (result) in
                // 新增一个闹钟时间
                let todo4 = self.getDateWithDateString("2015-11-11 07:40:00")
                // 使用 append 方法添加
                todo.append("reminders", element: todo4, unique: true)
                todo.save({ (updateResult) in
                    XCTAssertNil(result.error)
                    if(result.isSuccess){
                        // 成功执行了 CQL
                    }
                    exception.fulfill()
                })
            })
        }
    }
    
    func getDateWithDateString(dateString:String) -> LCDate {
        let dateStringFormatter = NSDateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        let date = dateStringFormatter.dateFromString(dateString)!
        let lcDate = LCDate(date);
        return lcDate;
    }
}
