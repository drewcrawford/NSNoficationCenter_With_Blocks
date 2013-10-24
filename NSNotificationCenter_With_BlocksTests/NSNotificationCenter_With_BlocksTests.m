//
//  NSNotificationCenter_With_BlocksTests.m
//  NSNotificationCenter_With_BlocksTests
//
//  Created by Drew Crawford on 10/24/13.
//  Copyright (c) 2013 DrewCrawfordApps. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Attempt1.h"
#import "Attempt2.h"
#import "Attempt3.h"
#import "Attempt4.h"
#import "Attempt5.h"
#import "Attempt6.h"
#import "Attempt7.h"
#import "YourAttempt.h"
#import "shared.h"

@interface NSNotificationCenter_With_BlocksTests : XCTestCase

@end

@implementation NSNotificationCenter_With_BlocksTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    for(int i =0; i < 5; i++) {
        YourAttempt *attempt1 = [[YourAttempt alloc] init];
        [[NSNotificationCenter defaultCenter] postNotificationName:notificationName object:nil];
        XCTAssertEqual(counter, i+1, @"Unexpected value for counter.");
        XCTAssertEqual(1, attempt1.localCounter, @"Unexpected value for localCounter.");
    }
}

@end
