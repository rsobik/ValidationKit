//
//  RSNotValidator.m
//  RSValidation
//
//  Created by Raphael Sobik on 01.11.12.
//  Copyright (c) 2012 Raphael Sobik. All rights reserved.
//

#import "RSNotValidator.h"

@interface RSNotValidator ()

@property (nonatomic, strong) RSValidator *validator;

@end

@implementation RSNotValidator

- (id)initWithValidator:(RSValidator *)validator
{
    self = [super init];
    if (self) {
        _validator = validator;
    }

    return self;
}

- (BOOL)validateObject:(id)object error:(NSError *__autoreleasing *)error
{
    return ![self.validator validateObject:object error:error];
}

@end
