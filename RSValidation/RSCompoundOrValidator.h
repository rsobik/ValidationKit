//
//  RSCompoundOrValidator.h
//  ValidationKit
//
//  Created by Raphael Sobik on 10.11.12.
//  Copyright (c) 2012 Raphael Sobik. All rights reserved.
//

#import "RSValidator.h"

@interface RSCompoundOrValidator : RSValidator

- (id)initWithValidators:(NSArray *)validators;

@end
