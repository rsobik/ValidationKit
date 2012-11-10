//
//  RSNilValidator.m
//  RSValidation
//
//  Created by Raphael Sobik on 01.11.12.
//  Copyright (c) 2012 Raphael Sobik. All rights reserved.
//

#import "RSNilValidator.h"

@implementation RSNilValidator

- (BOOL)validateObject:(id)object error:(NSError **)error
{
    BOOL isNil = object == nil;

    if (!isNil && error) {
        *error = [NSError errorWithDomain:RSValidatorErrorDomain code:RSValidatorErrorCodeInvalid userInfo:nil];
    }

    return isNil;
}

@end
