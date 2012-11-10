//
//  RSBlockValidator.h
//  ValidationKit
//
//  Created by Raphael Sobik on 10.11.12.
//  Copyright (c) 2012 Raphael Sobik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RSValidator.h"

typedef BOOL(^RSValidatorBlock)(id object, NSError **error);

@interface RSBlockValidator : NSObject <RSValidator>

- (id)initWithBlock:(RSValidatorBlock)validationBlock;

@end
