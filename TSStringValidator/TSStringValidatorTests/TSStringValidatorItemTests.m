//
//  TSStringValidatorItemTests.h
//  TSStringDataValidator
//
//  Created by Tomasz Szulc on 21.12.2013.
//  Copyright (c) 2013 Tomasz Szulc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TSStringValidatorItem.h"

@interface TSStringValidatorItemTests : XCTestCase

@end

@implementation TSStringValidatorItemTests {
    TSStringValidatorItem *_stringValidatorItem;
}

- (void)setUp
{
    [super setUp];
    _stringValidatorItem = [TSStringValidatorItem itemWithString:@"string" patternIdentifier:@"identifier" allowsEmpty:NO];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testThatObjectShouldBeNotNil {
    XCTAssertNotNil(_stringValidatorItem, @"");
}

- (void)testThatObjectShouldBeNotNilWithShortInitializer {
    TSStringValidatorItem *item = [TSStringValidatorItem itemWithString:@"string" patternIdentifier:@"identifier"];
    XCTAssertNotNil(item, @"");
}

- (void)testThatObjectShouldHasSetAllowsEmptyToYesWithShortInitializer {
    TSStringValidatorItem *item = [TSStringValidatorItem itemWithString:@"string" patternIdentifier:@"identifier"];
    XCTAssertTrue(item.allowsEmpty, @"");
}

- (void)testThatObjectShouldBeNilIfStringIsNil {
    XCTAssertNil([TSStringValidatorItem itemWithString:nil patternIdentifier:@"identifier" allowsEmpty:NO], @"");
}

- (void)testThatObjectShouldBeNilIfPatternIsNil {
    XCTAssertNil([TSStringValidatorItem itemWithString:@"string" patternIdentifier:nil allowsEmpty:NO], @"");
}

- (void)testThatObjectShouldHasCorrectStringValue {
    XCTAssertEqualObjects(_stringValidatorItem.stringValue, @"string", @"");
}

- (void)testThatObjectShouldHasCorrectPattern {
    XCTAssertEqualObjects(_stringValidatorItem.patternIdentifier, @"identifier", @"");
}

- (void)testThatObjectShouldHasCorrectallowsEmptyValue {
    XCTAssertEqual(_stringValidatorItem.allowsEmpty, NO, @"");
}

@end
