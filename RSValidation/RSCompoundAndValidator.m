//
//  RSCompoundAndValidator.m
//  RSValidation
//
//  Created by Raphael Sobik on 01.11.12.
//  Copyright (c) 2012 Raphael Sobik. All rights reserved.
//

#import "RSCompoundAndValidator.h"

@interface RSCompoundAndValidator ()

@property (nonatomic, copy) NSArray *validators;

@end

@implementation RSCompoundAndValidator

- (id)initWithValidators:(NSArray *)validators
{
    self = [super init];
    if (self) {
        _validators = [validators copy];
    }

    return self;
}

- (BOOL)validateObject:(id)object error:(NSError *__autoreleasing *)error
{
    for (RSValidator *validator in self.validators) {
        BOOL valid = [validator validateObject:object error:error];
        if (!valid) {
            return NO;
        }
    }

    return YES;
}

@end
