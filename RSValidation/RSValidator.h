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

@interface RSValidator : NSObject <NSCopying>

- (BOOL)validateObject:(id)object error:(NSError *__autoreleasing *)error;

+ (id)validatorForClass:(Class)klass;
+ (id)validatorForPredicate:(NSPredicate *)predicate;
+ (id)validatorByNegating:(RSValidator *)validator;
+ (id)validatorWithBlock:(BOOL (^)(id obj, NSError **error))validationBlock;

+ (id)andValidatorForValidators:(NSArray *)validators;
+ (id)orValidatorForValidators:(NSArray *)validators;

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
