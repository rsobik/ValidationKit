//
//  RSValidator.h
//  RSValidation
//
//  Created by Raphael Sobik on 01.11.12.
//  Copyright (c) 2012 Raphael Sobik. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString * const RSValidatorErrorDomain;
typedef enum {
    RSValidatorErrorCodeInvalid
} RSValidatorErrorCode;

@protocol RSValidator <NSObject>

- (BOOL)validateObject:(id)object error:(NSError **)error;

@end

@interface RSValidator : NSObject <RSValidator>

+ (id)validatorForClass:(Class)klass;
+ (id)validatorForPredicate:(NSPredicate *)predicate;
+ (id)validatorWithValidators:(NSArray *)validators;
+ (id)validatorByNegating:(id<RSValidator>)validator;

+ (id)validatorForString;
+ (id)validatorForNumber;
+ (id)validatorForDate;
+ (id)validatorForData;

+ (id)validatorForArray;
+ (id)validatorForSet;
+ (id)validatorForDictionary;

+ (id)validatorForNil;
+ (id)validatorForNotNil;

@end
