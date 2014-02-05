//
//  TSStringValidatorItem.h
//  TSStringDataValidator
//
//  Created by Tomasz Szulc on 21.12.2013.
//  Copyright (c) 2013 Tomasz Szulc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSStringValidatorItem : NSObject

/**
 string value to validate
 */
@property (nonatomic, readonly, copy) NSString *stringValue;

/**
 identifier of TSStringValidatorPattern object
 */
@property (nonatomic, readonly, copy) NSString *patternIdentifier;

/**
 Used during validation process.
 If allowsEmpty set to yes, empty string will be valid. 
 Default set to YES
 */
@property (nonatomic, readonly, assign) BOOL allowsEmpty;

/**
 @define Creates item with passed parameters
 @abstract Method used to create item which will be validated
 @param string String to validate
 @param identifier Identifier of TSStringValidatorPattern object
 @param allowsEmpty It tells the validator that stringValue may be empty (but not nil) and validation returns success. Default set to YES. If allowsEmpty should be set to YES you should consider use shorter initializer
 */
+ (instancetype)itemWithString:(NSString *)string patternIdentifier:(NSString *)identifier allowsEmpty:(BOOL)allowsEmpty;

/**
 @define Creates item with passed parameters
 @abstract Method used to create item which will be validated
 @param string String to validate
 @param identifier Identifier of TSStringValidatorPattern object
 */
+ (instancetype)itemWithString:(NSString *)string patternIdentifier:(NSString *)identifier;

@end
