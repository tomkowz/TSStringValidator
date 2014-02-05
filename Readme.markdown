TSStringValidator
=================

Couple of classes which you can simply use to validate strings in the project

What's inside
==================

**TSStringValidator** - Class which stores patterns and has ability to validate TSStringValidatorItems

**TSStringValidatorItem** - Item which will be validate by TSStringValidator

**TSStringValidatorPattern** - Pattern which will be used in validation process

How to use it?
=================
First case (Extended):
    - (void)firstCase {
    /// You can create validator
    TSStringValidator *validator = [TSStringValidator new];
    /// Configure patterns
    [validator addPatterns:@[[TSStringValidatorPattern patternWithString:@"[a-z]+" identifier:@"characters"],
                             [TSStringValidatorPattern patternWithString:@"[0-9]+" identifier:@"numbers"]]];
    /// Set as shared instance
    [TSStringValidator setSharedValidator:validator];
    
    /// In other place you can create items
    TSStringValidatorItem *item1 = [TSStringValidatorItem itemWithString:@"string" patternIdentifier:@"characters" allowsEmpty:NO];
    TSStringValidatorItem *item2 = [TSStringValidatorItem itemWithString:@"10202" patternIdentifier:@"numbers" allowsEmpty:NO];
    TSStringValidatorItem *item3 = [TSStringValidatorItem itemWithString:@"" patternIdentifier:@"numbers"];
    
    /// And call validator's methods globally.
    StringValidationResult result1 = [validator validateItem:item1];
    StringValidationResult result2 = [validator validateItem:item2];
    StringValidationResult result3 = [validator validateItem:item3];
    BOOL valid = (result1 == StringValidationResultOK &&
                  result2 == StringValidationResultOK &&
                  result3 == StringValidationResultOK);
    NSLog(@"valid = %d", valid);
    }

Second case (Simple):
    - (void)secondCase {
    /// You can create validator
    TSStringValidator *validator = [TSStringValidator new];
    /// And validate strings quickly
    NSString *pattern1 = @"[a-z]+";
    NSString *pattern2 = @"[0-9]+";
    
    StringValidationResult result1 = [validator validateString:@"string" withPattern:pattern1 allowsEmpty:NO];
    StringValidationResult result2 = [validator validateString:@"10202" withPattern:pattern2 allowsEmpty:NO];
    StringValidationResult result3 = [validator validateString:@"" withPattern:pattern2 allowsEmpty:YES];
    
    BOOL valid = (result1 == StringValidationResultOK &&
                  result2 == StringValidationResultOK &&
                  result3 == StringValidationResultOK);
    NSLog(@"valid = %d", valid);
    }
