//
//  TSStringValidatorItem.m
//  TSStringDataValidator
//
//  Created by Tomasz Szulc on 21.12.2013.
//  Copyright (c) 2013 Tomasz Szulc. All rights reserved.
//

#import "TSStringValidatorItem.h"

@implementation TSStringValidatorItem

+ (instancetype)itemWithString:(NSString *)string patternIdentifier:(NSString *)identifier {
    return [self itemWithString:string patternIdentifier:identifier allowsEmpty:YES];
}

+ (instancetype)itemWithString:(NSString *)string patternIdentifier:(NSString *)identifier allowsEmpty:(BOOL)allowsEmpty {
    return [[TSStringValidatorItem alloc] initWithString:string patternIdentifier:identifier allowsEmpty:allowsEmpty];
}

- (instancetype)initWithString:(NSString *)string patternIdentifier:(NSString *)identifier allowsEmpty:(BOOL)allowsEmpty {
    if (!string || !identifier)
        return nil;
    
    self = [super init];
    if (self) {
        _stringValue = string;
        _patternIdentifier = identifier;
        _allowsEmpty = allowsEmpty;
    }
    return self;
}

@end
