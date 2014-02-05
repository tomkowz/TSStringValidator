//
//  TSStringValidatorPattern.h
//  TSStringDataValidator
//
//  Created by Tomasz Szulc on 21.12.2013.
//  Copyright (c) 2013 Tomasz Szulc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSStringValidatorPattern : NSObject

/**
 Regexp expression which will be used during validation process.
 */
@property (nonatomic, readonly, copy) NSString *patternString;

/**
 Identifier of this object.
 */
@property (nonatomic, readonly, copy) NSString *identifier;

/**
 @define Creates Pattern object with passed parameters
 @abstract Method used to create TSStringValidatorPattern object
 @abstract Arguments should be not equal to nil. Otherwise method returns nil.
 @param string String with Regular Expression
 @param identifier Identifier of pattern
 */
+ (instancetype)patternWithString:(NSString *)string identifier:(NSString *)identifier;

@end
