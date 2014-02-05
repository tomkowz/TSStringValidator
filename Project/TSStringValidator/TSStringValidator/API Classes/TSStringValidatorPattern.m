//
//  TSStringValidatorPattern.m
//  TSStringDataValidator
//
//  Created by Tomasz Szulc on 21.12.2013.
//  Copyright (c) 2013 Tomasz Szulc. All rights reserved.
//

#import "TSStringValidatorPattern.h"

@implementation TSStringValidatorPattern

+ (instancetype)patternWithString:(NSString *)string identifier:(NSString *)identifier {
    return [[TSStringValidatorPattern alloc] initWithString:string identifier:identifier];
}

- (instancetype)initWithString:(NSString *)string identifier:(NSString *)identifier {
    if (!string || !identifier) return nil;
    
    if (self = [super init]) {
        _patternString = string;
        _identifier = identifier;
    }
    return self;
}

@end
