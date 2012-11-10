//
//  RSCompoundOrValidator.m
//  ValidationKit
//
//  Created by Raphael Sobik on 10.11.12.
//  Copyright (c) 2012 Raphael Sobik. All rights reserved.
//

#import "RSCompoundOrValidator.h"

@interface RSCompoundOrValidator ()

@property (nonatomic, copy) NSArray *validators;

@end

@implementation RSCompoundOrValidator

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
    for (id<RSValidator> validator in self.validators) {
        if ([validator validateObject:object error:error]) {
            return YES;
        } else {
            break;
        }
    }

    return NO;
}

@end
