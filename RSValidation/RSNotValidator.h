//
//  RSNotValidator.h
//  RSValidation
//
//  Created by Raphael Sobik on 01.11.12.
//  Copyright (c) 2012 Raphael Sobik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RSValidator.h"

@interface RSNotValidator : NSObject <RSValidator>

- (id)initWithValidator:(id<RSValidator>)validator;

@end
