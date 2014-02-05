//
//  TSStringValidatorEngine.m
//  TSStringDataValidator
//
//  Created by Tomasz Szulc on 21.12.2013.
//  Copyright (c) 2013 Tomasz Szulc. All rights reserved.
//

#import "TSStringValidatorEngine.h"

@implementation TSStringValidatorEngine

- (BOOL)validateString:(NSString *)string withPattern:(NSString *)pattern {
    if (!string || !pattern) return NO;
    
    NSError *error = nil;
    NSRegularExpression *regex = [[NSRegularExpression alloc]
                                  initWithPattern:pattern
                                  options:NSRegularExpressionCaseInsensitive
                                  error:&error];
    
    NSRange credentialRange = NSMakeRange(0, string.length);
    NSRange matchRange = [regex rangeOfFirstMatchInString:string options:0 range:credentialRange];
    
    BOOL result = NO;
    if (NSEqualRanges(matchRange, credentialRange))
        result = YES;
    
    return result;
}

@end
