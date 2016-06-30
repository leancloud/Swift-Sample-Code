# LeanCloud Swift SDK 文档示例代码
## 文档地址
[Swift 数据存储开发指南](https://leancloud.cn/docs/leanstorage_guide-swift.html)

## 功能
当开发者阅读文档的代码片段，想要阅读更多关于执行代码片段使用的前置条件时，可以阅读本项目里面一一对应的代码片段的测试用例，这样可以方便开发者使用接口的时候有一个最佳实践的参考。

## 贡献代码
从文档中找到对应代码片段的 Test Case 的源代码，修改，然后发出 PR，主分支(master)会有 travis CI 的脚本自动运行单元测试，只有测试全都通过才可以被合并到主分支，而文档对应的地方也应该及时修改。

## 代码示例

```swift
//
//  LCObject#saveWithProperties.swift
//  Swift-Sample-Code
//
//  Created by WuJun on 6/28/16.
//  Copyright © 2016 leancloud. All rights reserved.
//

import XCTest
import LeanCloud

class LCObject_saveWithProperties: BaseTestCase {
    
    func testSaveTodoWithPropeties() {
        
        await("Save Todo with properties") { (exception) in
            // className 参数对应控制台中的 Class Name
            let todo = LCObject(className: "Todo")
            todo.set("title", value:"工作" as LCString)
            todo.set("content", object: "每周工程师会议，周一下午2点")
            
            todo.save { result in
                XCTAssertTrue(result.isSuccess)
                exception.fulfill()
            }
        }
    }
}

```

其中 `await("Save Todo with properties") { (exception) in}` 标明是正在测试一个异步的接口，但是一定要在测试用例内部显示的调用一下 `exception.fulfill()`，否则一定会测试失败。

## FAQ
Q：SDK 更新会对当前项目产生影响么？

A：会，目前 Swift SDK 每一次有新的 PR 被 merge 进主分支，都会发送一个 PR 到当前项目，这样也会触发 travis CI 进行自动化检测，测试结果没有通过，会及时通知文档维护人员进行查看，需要手动的去比对文档中的代码，这样可以避免过期方法或者接口更名对用户造成的困扰。