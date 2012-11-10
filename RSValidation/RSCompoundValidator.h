//
//  RSCompoundValidator.h
//  RSValidation
//
//  Created by Raphael Sobik on 01.11.12.
//  Copyright (c) 2012 Raphael Sobik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RSValidator.h"

@interface RSCompoundValidator : NSObject <RSValidator>

- (id)initWithValidators:(NSArray *)validators;

@end