//
//  TSStringValidator.m
//  TSStringDataValidator
//
//  Created by Tomasz Szulc on 21.12.2013.
//  Copyright (c) 2013 Tomasz Szulc. All rights reserved.
//

#import "TSStringValidator.h"
#import "TSStringValidatorItem.h"
#import "TSStringValidatorPattern.h"
#import "TSStringValidatorEngine.h"

@implementation TSStringValidator {
    NSMutableArray *_patterns;
    TSStringValidatorEngine *_engine;
}

static TSStringValidator *_validator = nil;
+ (void)setSharedValidator:(TSStringValidator *)validator {
    _validator = validator;
}

+ (instancetype)sharedValidator {
    return _validator;
}

- (id)init {
    self = [super init];
    if (self) {
        _patterns = [NSMutableArray array];
        _engine = [TSStringValidatorEngine new];
    }
    return self;
}

- (void)addPattern:(TSStringValidatorPattern *)pattern {
    if (pattern) {
        BOOL exists = [self checkIfPatternWithIdentifierExists:pattern.identifier];
        if (!exists) [_patterns addObject:pattern];
    }
}

- (void)addPatterns:(NSArray *)patterns {
    for (TSStringValidatorPattern *p in patterns) {
        [self addPattern:p];
    }
}

- (void)removePattern:(TSStringValidatorPattern *)pattern {
    if (pattern) {
        BOOL exists = [self checkIfPatternWithIdentifierExists:pattern.identifier];
        if (exists) [_patterns removeObject:pattern];
    }
}

- (void)removePatternWithIdentifier:(NSString *)identifier {
    if (identifier) {
        TSStringValidatorPattern *pattern = [self _patternForIdentifier:identifier];
        [self removePattern:pattern];
    }
}

- (BOOL)checkIfPatternWithIdentifierExists:(NSString *)identifier {
    BOOL exists = NO;
    for (TSStringValidatorPattern *p in _patterns) {
        if ([p.identifier isEqualToString:identifier]) {
            exists = YES;
            break;
        }
    }
    return exists;
}


#pragma mark - Validation
- (StringValidationResult)validateItem:(TSStringValidatorItem *)item {
    return [self validateItem:item withPattern:[self _patternForIdentifier:item.patternIdentifier]];
}

- (StringValidationResult)validateItem:(TSStringValidatorItem *)item withPattern:(TSStringValidatorPattern *)pattern {
    if (!item || !pattern) {
        return StringValidationResultFailure;
    }
    
    StringValidationResult result = StringValidationResultFailure;
    if (!item.stringValue)
        result = StringValidationResultFailure;
    else if (item.stringValue.length == 0) {
        result = item.allowsEmpty ? StringValidationResultOK : StringValidationResultEmptyField;
    } else {
        BOOL valid = [_engine validateString:item.stringValue withPattern:pattern.patternString];
        if (valid) result = StringValidationResultOK;
    }
    return result;
}

- (StringValidationResult)validateString:(NSString *)string withPattern:(NSString *)patternString allowsEmpty:(BOOL)allowsEmpty {
    static NSString *identifier = @"patternIdentifier";
    TSStringValidatorItem *item = [TSStringValidatorItem itemWithString:string patternIdentifier:identifier allowsEmpty:allowsEmpty];
    TSStringValidatorPattern *pattern = [TSStringValidatorPattern patternWithString:patternString identifier:identifier];
    
    return [self validateItem:item withPattern:pattern];
}


#pragma mark - Internal methods
- (TSStringValidatorPattern *)_patternForIdentifier:(NSString *)identifier {
    TSStringValidatorPattern *pattern = nil;
    for (TSStringValidatorPattern *p in _patterns) {
        if ([p.identifier isEqualToString:identifier]) {
            pattern = p;
            break;
        }
    }
    return pattern;
}

@end
