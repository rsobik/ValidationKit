//
//  RSPredicateEvaluator.h
//  RSValidation
//
//  Created by Raphael Sobik on 01.11.12.
//  Copyright (c) 2012 Raphael Sobik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RSValidator.h"

@interface RSPredicateValidator : RSValidator

- (id)initWithPredicate:(NSPredicate *)predicate;

@end
