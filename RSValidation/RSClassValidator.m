//
//  RSClassValidator.m
//  RSValidation
//
//  Created by Raphael Sobik on 01.11.12.
//  Copyright (c) 2012 Raphael Sobik. All rights reserved.
//

#import "RSClassValidator.h"

@interface RSClassValidator()

@property (nonatomic, strong) Class klass;

@end

@implementation RSClassValidator

- (id)initWithClass:(Class)klass
{
    self = [super init];
    if (self) {
        _klass = klass;
    }

    return self;
}

- (BOOL)validateObject:(id)object error:(NSError **)error
{
    BOOL isKindOfClass = [object isKindOfClass:self.klass];
    
    if (!isKindOfClass && error) {
        *error = [NSError errorWithDomain:RSValidatorErrorDomain code:RSValidatorErrorCodeInvalid userInfo:nil];
    }

    return isKindOfClass;
}

@end
