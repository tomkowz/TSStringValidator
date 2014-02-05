//
//  TSStringValidatorEngine.h
//  TSStringDataValidator
//
//  Created by Tomasz Szulc on 21.12.2013.
//  Copyright (c) 2013 Tomasz Szulc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSStringValidatorEngine : NSObject

/** 
 @define validate string with pattern
 @abstract Method used to validate string with passed string value and pattern string (regular expression pattern). Return YES if valid, otherwise NO.
 */
- (BOOL)validateString:(NSString *)string withPattern:(NSString *)pattern;

@end
