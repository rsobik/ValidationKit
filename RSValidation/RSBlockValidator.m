//
//  RSBlockValidator.m
//  ValidationKit
//
//  Created by Raphael Sobik on 10.11.12.
//  Copyright (c) 2012 Raphael Sobik. All rights reserved.
//

#import "RSBlockValidator.h"

@interface RSBlockValidator ()

@property (nonatomic, copy) RSValidatorBlock block;

@end

@implementation RSBlockValidator

- (id)initWithBlock:(RSValidatorBlock)validationBlock
{
    self = [super init];
    if (self) {
        _block = [validationBlock copy];
    }

    return self;
}

- (BOOL)validateObject:(id)object error:(NSError *__autoreleasing *)error
{
    return self.block(object, error);
}

@end
