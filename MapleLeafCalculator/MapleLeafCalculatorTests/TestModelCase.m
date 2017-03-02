//
//  TestModelCase.m
//  MapleLeafCalculator
//
//  Created by Liuguiliang on 2017/2/28.
//  Copyright © 2017年 HuiDragon. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface TestModelCase : XCTestCase

@end

@implementation TestModelCase

/**
 测试时同步执行的，因为每个测试都是一个一个独立的调用。但很多代码是异步执行。为了处理异步执行方法和函数的测试组件，Xcode 6 的XCTest有所改善：等待异步回到完成或者超时，序列化异步执行的测试方法。
 */

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

//Test that the document is opened. Because opening is asynchronous,
//use XCTestCase's asynchronous APIs to wait until the doucument has finished opening.

- (void)testDocumentOpening {
    //Create an expection object.
    //This test only has one, but it's possible to wait on multiple expections.
    
    XCTestExpectation *documentOpenExpectation = [self expectationWithDescription:@"document open"];
    NSURL *URL = [[NSBundle bundleForClass:[self class]] URLForResource:@"TestDocument" withExtension:@"mydoc"];
    UIDocument *doc = [[UIDocument alloc] initWithFileURL:URL];
    [doc openWithCompletionHandler:^(BOOL success) {
       
        XCTAssert(success);
        //Possibly assert other things here about the document after it hase opened...
        //Fulfill the expectation-this will cause -waitForExpectation
        //to invoke its completion handler and then return.
        
        [documentOpenExpectation fulfill];
        
    }];
    
    
    //The test will pause here, running the run loop, until the timout is hit
    //or all expectations are fullfilled.
    [self waitForExpectationsWithTimeout:1 handler:^(NSError * _Nullable error) {
        [doc closeWithCompletionHandler:nil];
    }];
    //关于编写异步操作方法的详细信息，参见XCTest.framework中的XCTestCase+AsynchronousTesting.h头文件。
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testModelCase {
    //Set up, call test subject API, (Code could be shared in setup method.)
    //Test logic and values, assertions report pass/fail to testing framework.
    //Tear down,(Code could be shared in tearDown method.)
}
- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

/**实现性能测试， 使用Xcode */
- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

/**
 性能测试：
 性能测试需要运行十次代码块
 */
@end
