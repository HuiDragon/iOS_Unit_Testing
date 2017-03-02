//
//  MapleLeafCalculatorTests.m
//  MapleLeafCalculatorTests
//
//  Created by Liuguiliang on 2017/2/28.
//  Copyright © 2017年 HuiDragon. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"
#import "AppDelegate.h"

@interface MapleLeafCalculatorTests : XCTestCase


@property (strong, nonatomic) UIApplication *app;
@property (strong, nonatomic) ViewController *vc;
@property (strong, nonatomic) UIView *view;



@end

@implementation MapleLeafCalculatorTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.app = [UIApplication sharedApplication];
    self.vc = (ViewController *)self.app.keyWindow.rootViewController;
    self.view = self.vc.view;
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


- (void)testApp
{
    XCTAssertNotNil(self.app, @"Cannot find UIApplication instance.");
}

- (void)testVC
{
    XCTAssertNotNil(self.vc, @"Cannot find ViewController instance.");
}

- (void)testView
{
    XCTAssertNotNil(self.view, @"Cannot find ViewController instance.");

}

- (void)testSubtraction
{

    /*************** 12 - 4 = 8 ******************/
    //点击 12
    [self.vc press:[self.view viewWithTag:1]];
    [self.vc press:[self.view viewWithTag:2]];

    //点击 -
    [self.vc press:[self.view viewWithTag:14]];
    //点击 4
    [self.vc press:[self.view viewWithTag:4]];
    // = 8
    [self.vc press:[self.view viewWithTag:12]];
    //断言
    XCTAssertEqualObjects(self.vc.displayField.text, @"8",@"Part 1 faild");
    
    
    /*************** 12 - 4 - 8 = 0  ******************/
    //点击 -
    [self.vc press:[self.view viewWithTag:14]];
    //点击 8
    [self.vc press:[self.view viewWithTag:8]];
    // = 0
    [self.vc press:[self.view viewWithTag:12]];
    XCTAssertEqualObjects(self.vc.displayField.text, @"0",@"Part 2 faild");
}

- (void)testAddition
{
    /*************** 6 + 2 = 8 ******************/
    //点击 6
    [self.vc press:[self.view viewWithTag:6]];
    //点击 +
    [self.vc press:[self.view viewWithTag:13]];
    //点击 2
    [self.vc press:[self.view viewWithTag:2]];
    // = 8
    [self.vc press:[self.view viewWithTag:12]];
    //断言
    XCTAssertEqualObjects(self.vc.displayField.text, @"8",@"Part 1 faild");
    
    
     /*************** 6 + 2 + 4 = 12 ******************/
    //点击 +
    [self.vc press:[self.view viewWithTag:13]];
    //点击 2
    [self.vc press:[self.view viewWithTag:4]];
    // = 12
    [self.vc press:[self.view viewWithTag:12]];
        XCTAssertEqualObjects(self.vc.displayField.text, @"12",@"Part 2 faild");
    
    
}


- (void)testMultiplication
{
    /*************** 63 * 2 = 126 ******************/
    //点击 63
    [self.vc press:[self.view viewWithTag:6]];
    [self.vc press:[self.view viewWithTag:3]];

    //点击 *
    [self.vc press:[self.view viewWithTag:15]];
    //点击 2
    [self.vc press:[self.view viewWithTag:2]];
    // = 126
    [self.vc press:[self.view viewWithTag:12]];
    //断言
    XCTAssertEqualObjects(self.vc.displayField.text, @"126",@"Multiplication failed!");
}


- (void)testDivision
{ }

- (void)testDelete
{ }

- (void)testClear
{ }

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testAdditionPerformance
{
    // set the initial state
    [self measureBlock:^{
        
        [self.vc press:[self.view viewWithTag:6]];// 6
        //iterate for 100000 cycles of adding 2
        for (int i = 0; i < 100000; i ++) {
            [self.vc press:[self.view viewWithTag:13]];// +
            [self.vc press:[self.view viewWithTag:2]];// 2
            [self.vc press:[self.view viewWithTag:12]];// =
        }
    }];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
