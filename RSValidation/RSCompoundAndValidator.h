//
//  RSCompoundAndValidator.h
//  RSValidation
//
//  Created by Raphael Sobik on 01.11.12.
//  Copyright (c) 2012 Raphael Sobik. All rights reserved.
//

#import "RSValidator.h"

@interface RSCompoundAndValidator : RSValidator

- (id)initWithValidators:(NSArray *)validators;

@end
