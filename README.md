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
``` objc
    TSStringValidator *manager = [TSStringValidator new];
    [manager addPattern:[TSStringValidatorPattern patternWithString:@"[a-z]" identifier:@"characters"]];
    [manager addPattern:[TSStringValidatorPattern patternWithString:@"[0-9]" identifier:@"numbers"]];
    //    [TSStringValidator setSharedValidator:manager];
    
    TSStringValidatorItem *item1 = [TSStringValidatorItem itemWithString:@"string" patternIdentifier:@"characters" allowsEmpty:NO];
    TSStringValidatorItem *item2 = [TSStringValidatorItem itemWithString:@"10202" patternIdentifier:@"numbers" allowsEmpty:NO];
    TSStringValidatorItem *item3 = [TSStringValidatorItem itemWithString:@"" patternIdentifier:@"numbers"];
    
    BOOL valid1 = [manager validateItem:item1];
    BOOL valid2 = [manager validateItem:item2];
    BOOL valid3 = [manager validateItem:item3];
    NSLog(@"valid = %d", valid1 && valid2 && valid3);
```
