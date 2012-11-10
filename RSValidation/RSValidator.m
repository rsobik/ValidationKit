//
//  RSValidator.m
//  RSValidation
//
//  Created by Raphael Sobik on 01.11.12.
//  Copyright (c) 2012 Raphael Sobik. All rights reserved.
//

#import "RSValidator.h"
#import "RSClassValidator.h"
#import "RSNilValidator.h"
#import "RSPredicateValidator.h"
#import "RSEnumerationValidator.h"
#import "RSNotValidator.h"
#import "RSCompoundAndValidator.h"
#import "RSBlockValidator.h"
#import "RSCompoundAndValidator.h"
#import "RSCompoundOrValidator.h"

NSString * const RSValidatorErrorDomain = @"RSValidatorErrorDomain";

@implementation RSValidator

+ (id)validatorForClass:(Class)klass
{
    return [[RSClassValidator alloc] initWithClass:klass];
}

+ (id)validatorForPredicate:(NSPredicate *)predicate
{
    return [[RSPredicateValidator alloc] initWithPredicate:predicate];
}

+ (id)validatorByNegating:(id<RSValidator>)validator
{
    return [[RSNotValidator alloc] initWithValidator:validator];
}

+ (id)validatorWithBlock:(BOOL (^)(id obj, NSError **error))validationBlock
{
    return [[RSBlockValidator alloc] initWithBlock:validationBlock];
}

+ (id)andValidatorForValidators:(NSArray *)validators
{
    return [[RSCompoundAndValidator alloc] initWithValidators:validators];
}

+ (id)orValidatorForValidators:(NSArray *)validators
{
    return [[RSCompoundOrValidator alloc] initWithValidators:validators];
}

+ (id)validatorForString
{
    return [self validatorForClass:[NSString class]];
}

+ (id)validatorForNumber
{
    return [self validatorForClass:[NSNumber class]];
}

+ (id)validatorForDate
{
    return [self validatorForClass:[NSDate class]];
}

+ (id)validatorForData
{
    return [self validatorForClass:[NSData class]];
}

+ (id)validatorForArray
{
    return [self validatorForClass:[NSArray class]];
}

+ (id)validatorForSet
{
    return [self validatorForClass:[NSSet class]];
}

+ (id)validatorForDictionary
{
    return [self validatorForClass:[NSDictionary class]];
}

+ (id)validatorForNil
{
    return [self validatorByNegating:[self validatorForNil]];
}

+ (id)validatorForNotNil
{
    return [[RSNilValidator alloc] init];
}

- (BOOL)validateObject:(id)object error:(NSError *__autoreleasing *)error
{
    return NO;
}

@end

