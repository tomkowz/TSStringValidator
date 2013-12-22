//
//  TSStringValidatorTests.m
//  TSStringDataValidator
//
//  Created by Tomasz Szulc on 21.12.2013.
//  Copyright (c) 2013 Tomasz Szulc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TSStringValidator.h"
#import "TSStringValidatorPattern.h"
#import "TSStringValidatorItem.h"

@interface TSStringValidatorTests : XCTestCase

@end

@implementation TSStringValidatorTests {
    TSStringValidator *_validator;
    TSStringValidatorPattern *_pattern1;
    TSStringValidatorPattern *_pattern2;
}

- (void)setUp
{
    [TSStringValidator setSharedValidator:nil];
    _validator = [TSStringValidator new];
    _pattern1 = [TSStringValidatorPattern patternWithString:@"[a-z]*" identifier:@"characters"];
    _pattern2 = [TSStringValidatorPattern patternWithString:@"[a-zA-Z]*" identifier:@"characters2"];

    [super setUp];
}

- (void)tearDown
{
    [TSStringValidator setSharedValidator:nil];
    [super tearDown];
}


#pragma mark - Initialization
- (void)testThatSharedValidatorIsNil {
    XCTAssertNil([TSStringValidator sharedValidator], @"");
}

- (void)testThatValidatorShouldNotBeNil {
    XCTAssertNotNil(_validator, @"");
}

- (void)testThatSharedValidatorShouldBeSameAsManager {
    [TSStringValidator setSharedValidator:_validator];
    XCTAssertEqualObjects(_validator, [TSStringValidator sharedValidator], @"");
}

- (void)testThatPatternsShouldBeNotNilAfterInit {
    XCTAssertNotNil(_validator.patterns, @"");
}

- (void)testThatPatternsShouldBeEmptyAfterInit {
    XCTAssertEqual(_validator.patterns.count, (NSUInteger)0, @"");
}


#pragma mark addPattern:
- (void)testThatPatternsShouldHaveTwoElements {
    [_validator addPattern:_pattern1];
    [_validator addPattern:_pattern2];
    XCTAssertEqual(_validator.patterns.count, (NSUInteger)2, @"");
}

- (void)testThatPatternsForTheSameKeyShouldBeReplaced {
    [_validator addPattern:_pattern1];
    [_validator addPattern:_pattern1];
    
    XCTAssertEqual(_validator.patterns.count, (NSUInteger)1, @"");
}

- (void)testThatNilPatternShouldNotBeAdded {
    [_validator addPattern:nil];
    XCTAssertEqual(_validator.patterns.count, (NSUInteger)0, @"");
}

#pragma mark addPatterns:
- (void)testThatPatternsShouldBeAdded {
    [_validator addPatterns:@[_pattern1, _pattern2]];
    XCTAssertEqual(_validator.patterns.count, (NSUInteger)2, @"");
}

- (void)testThatOnePatternShouldBeAdded {
    [_validator addPatterns:@[_pattern1, _pattern1]];
    XCTAssertEqual(_validator.patterns.count, (NSUInteger)1, @"");
}


#pragma mark removePattern:
- (void)testThatPatternsShouldHaveZeroElementAfterRemove {
    [_validator addPattern:_pattern1];
    [_validator removePattern:_pattern1];
    XCTAssertEqual(_validator.patterns.count, (NSUInteger)0, @"");
}

- (void)testThatNilPatternShouldNotBeRemoved {
    XCTAssertNoThrow([_validator removePattern:nil], @"");
}


#pragma mark removePatterForIdentifier:
- (void)testThatPatternShouldBeRemovedWithIdentifier {
    [_validator addPattern:_pattern1];
    [_validator removePatternWithIdentifier:@"characters"];
    XCTAssertEqual(_validator.patterns.count, (NSUInteger)0, @"");
}

- (void)testThatNothingShouldBeHappendWhenRemovingPatternWithNilIdentifier {
    XCTAssertNoThrow([_validator removePatternWithIdentifier:nil], @"");
}


#pragma mark - validateItem:
- (void)testThatStringShouldBeValid {
    [_validator addPattern:_pattern1];
    TSStringValidatorItem *item = [TSStringValidatorItem itemWithString:@"string" patternIdentifier:_pattern1.identifier allowsEmpty:YES];
    XCTAssertEqual([_validator validateItem:item], StringValidationResultOK, @"");
}

- (void)testThatEmptyStringShouldBeOK {
    [_validator addPattern:_pattern1];
    TSStringValidatorItem *item = [TSStringValidatorItem itemWithString:@"" patternIdentifier:_pattern1.identifier allowsEmpty:YES];
    XCTAssertEqual([_validator validateItem:item], StringValidationResultOK, @"");
}

- (void)testThatEmptyStringShouldBeFailure {
    [_validator addPattern:_pattern1];
    TSStringValidatorItem *item = [TSStringValidatorItem itemWithString:@"" patternIdentifier:_pattern1.identifier allowsEmpty:NO];
    XCTAssertEqual([_validator validateItem:item], StringValidationResultEmptyField, @"");
}

- (void)testThatStringShouldBeNotValidBecausePatternNotExists {
    TSStringValidatorItem *item = [TSStringValidatorItem itemWithString:@"abc" patternIdentifier:_pattern1.identifier allowsEmpty:NO];
    [_validator validateItem:item];
}


@end
