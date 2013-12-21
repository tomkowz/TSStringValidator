//
//  TSStringValidator.h
//  TSStringDataValidator
//
//  Created by Tomasz Szulc on 21.12.2013.
//  Copyright (c) 2013 Tomasz Szulc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TSStringValidatorPattern;
@class TSStringValidatorItem;

typedef enum {
    StringValidationResultFailure,
    StringValidationResultOK,
    StringValidationResultEmptyField
} StringValidationResult;

@interface TSStringValidator : NSObject

/**
 Patterns added via addPattern: method
 */
@property (nonatomic, readonly) NSArray *patterns;

/**
 @define Singleton getter
 @abstract Return shared validator if set. Otherwise nil
 */
+ (instancetype)sharedValidator;

/**
 @define Singleton setter
 @abstract Method used to set TSStringValidator object as singleton
*/
+ (void)setSharedValidator:(TSStringValidator *)validator;


/**
 @define Add pattern to validator
 @abstract Method uset to add pattern to patterns container
 @discussion If pattern has been added earlier the same patter will not be added again
 */
- (void)addPattern:(TSStringValidatorPattern *)pattern;

/**
 @define Remove pattern from validator
 @abstract Method used to remove existing pattern
 */
- (void)removePattern:(TSStringValidatorPattern *)pattern;

/**
 @define Remove pattern with identifier from validator
 @abstract Method remove pattern for passed identifier;
 @param identifier Identifier of pattern which will be removed
 */
- (void)removePatternWithIdentifier:(NSString *)identifier;


/**
 @define Validate item
 @abstract Method used to validation item passed as method argument
 @param item TSStringValidatorItem to validate
 */
- (StringValidationResult)validateItem:(TSStringValidatorItem *)item;

@end
