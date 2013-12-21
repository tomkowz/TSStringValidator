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

- (StringValidationResult)validateItem:(TSStringValidatorItem *)item {
    StringValidationResult result = StringValidationResultFailure;
    if (!item.stringValue)
        result = StringValidationResultFailure;
    else if (item.stringValue.length == 0 && !item.allowsEmpty) {
        result = StringValidationResultEmptyField;
    } else {
        TSStringValidatorPattern *pattern = [self _patternForIdentifier:item.patternIdentifier];
        BOOL valid = [_engine validateString:item.stringValue withPatternIdentifier:pattern.patternString];
        if (valid) result = StringValidationResultOK;
        
        return StringValidationResultOK;
    }
    return result;
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
