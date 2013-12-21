//
//  TSStringValidatorEngineTests.m
//  TSStringDataValidator
//
//  Created by Tomasz Szulc on 21.12.2013.
//  Copyright (c) 2013 Tomasz Szulc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TSStringValidatorEngine.h"

@interface TSStringValidatorEngineTests : XCTestCase

@end

@implementation TSStringValidatorEngineTests {
    TSStringValidatorEngine *_engine;
}

- (void)setUp
{
    [super setUp];
    _engine = [TSStringValidatorEngine new];
}

- (void)tearDown
{
    _engine = nil;
    [super tearDown];
}

- (void)testThatEngineShouldExists {
    XCTAssertNotNil(_engine, @"");
}

- (void)testThatValidationShouldReturnFalseIfStringNotExists {
    XCTAssertFalse([_engine validateString:nil withPatternIdentifier:@""], @"");
}

- (void)testThatValidationShouldReturnFalseIfPatterNotExists {
    XCTAssertFalse([_engine validateString:@"string" withPatternIdentifier:nil], @"");
}

- (void)testThatValidationShouldReturnTrue {
    XCTAssertTrue([_engine validateString:@"string" withPatternIdentifier:@"[a-z]+"], @"");
}

@end
