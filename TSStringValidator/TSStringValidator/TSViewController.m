//
//  TSViewController.m
//  TSStringValidator
//
//  Created by Tomasz Szulc on 21.12.2013.
//  Copyright (c) 2013 Tomasz Szulc. All rights reserved.
//

#import "TSViewController.h"
#import "TSStringValidator.h"
#import "TSStringValidatorItem.h"
#import "TSStringValidatorPattern.h"

@interface TSViewController ()

@end

@implementation TSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
