//
//  RSEnumerationValidator.m
//  RSValidation
//
//  Created by Raphael Sobik on 01.11.12.
//  Copyright (c) 2012 Raphael Sobik. All rights reserved.
//

#import "RSEnumerationValidator.h"

@interface RSEnumerationValidator ()

@property (nonatomic, strong) id<RSValidator> validator;

@end

@implementation RSEnumerationValidator

- (id)initWithValidator:(id<RSValidator>)validator
{
    self = [super init];
    if (self) {
        _validator = validator;
    }

    return self;
}

- (BOOL)validateObject:(id)enumeration error:(NSError **)error
{
    for (id object in enumeration) {
        BOOL valid = [self.validator validateObject:object error:error];
        if (!valid) {
            return NO;
        }
    }

    return YES;
}

@end
