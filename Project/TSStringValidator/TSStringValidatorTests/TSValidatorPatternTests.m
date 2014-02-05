//
//  TSValidatorPatternTests.m
//  TSStringDataValidator
//
//  Created by Tomasz Szulc on 21.12.2013.
//  Copyright (c) 2013 Tomasz Szulc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TSStringValidatorPattern.h"
@interface TSValidatorPatternTests : XCTestCase

@end

@implementation TSValidatorPatternTests {
    TSStringValidatorPattern *_pattern;
}

- (void)setUp
{
    [super setUp];
    _pattern = [TSStringValidatorPattern patternWithString:@"[a-z]" identifier:@"characters"];
}

- (void)tearDown
{
    _pattern = nil;
    [super tearDown];
}


#pragma mark - Initialization
- (void)testThatObjectShouldNotBeNil {
    XCTAssertNotNil(_pattern, @"");
}

- (void)testThatObjectShouldBeNilWhenPatterIsNil {
    XCTAssertNil([TSStringValidatorPattern patternWithString:nil identifier:@""], @"");
}

- (void)testThatObjectShouldBenilWhenIdentiferIsNil {
    XCTAssertNil([TSStringValidatorPattern patternWithString:@"" identifier:nil], @"");
}


#pragma mark - Properties
- (void)testThatPatternStringIsSet {
    XCTAssertEqualObjects(_pattern.patternString, @"[a-z]", @"");
}

- (void)testThatIdentifierIsSet {
    XCTAssertEqualObjects(_pattern.identifier, @"characters", @"");
}


@end
