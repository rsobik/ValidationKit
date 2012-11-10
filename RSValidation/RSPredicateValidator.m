//
//  RSPredicateEvaluator.m
//  RSValidation
//
//  Created by Raphael Sobik on 01.11.12.
//  Copyright (c) 2012 Raphael Sobik. All rights reserved.
//

#import "RSPredicateValidator.h"

@interface RSPredicateValidator ()

@property (nonatomic, strong) NSPredicate *predicate;

@end

@implementation RSPredicateValidator

- (id)initWithPredicate:(NSPredicate *)predicate
{
    self = [super init];
    if (self) {
        _predicate = predicate;
    }

    return self;
}

- (BOOL)validateObject:(id)object error:(NSError *__autoreleasing *)error
{
    BOOL success = [self.predicate evaluateWithObject:object];

    if (!success && error) {
        *error = [NSError errorWithDomain:RSValidatorErrorDomain code:RSValidatorErrorCodeInvalid userInfo:nil];
    }

    return success;
}

@end
