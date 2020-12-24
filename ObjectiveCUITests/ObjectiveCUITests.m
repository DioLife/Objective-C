//
//  ObjectiveCUITests.m
//  ObjectiveCUITests
//
//  Created by lzd_free on 2020/12/23.
//  Copyright © 2020 William. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface ObjectiveCUITests : XCTestCase

@property(nonatomic,strong)XCUIApplication *app;

@end

@implementation ObjectiveCUITests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.

    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    _app = [[XCUIApplication alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // UI tests must launch the application that they test.
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app launch];

    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

-(void)testNetwork{
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app launch];
    [app.tables.staticTexts[@"原生网络请求"] tap];
    [app/*@START_MENU_TOKEN@*/.staticTexts[@"post example"]/*[[".buttons[@\"post example\"].staticTexts[@\"post example\"]",".staticTexts[@\"post example\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ tap];
    [NSThread sleepForTimeInterval:15];
}

- (void)testLaunchPerformance {
    if (@available(macOS 10.15, iOS 13.0, tvOS 13.0, *)) {
        // This measures how long it takes to launch your application.
        [self measureWithMetrics:@[[[XCTApplicationLaunchMetric alloc] init]] block:^{
            [[[XCUIApplication alloc] init] launch];
        }];
    }
}

@end
