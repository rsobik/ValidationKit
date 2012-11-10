# Validation Kit

## Introduction
This library is used to speed up the implementation of your model object validation code. It offers basic validations and compound
validations, which allow the composition of more complex validations.

## Installation
The easiest way to install ValidationKit is to use CocoaPods. If you do not want to use CocoaPods you
can clone the repository, add it to your project and add the static library as a target dependecy and
 link to it.

## Examples
Image you have a property that should be a number between 3 and 6. A possible implementation of the
validation:

```Objective-C

@interface House : NSObject

@property (nonatomic, copy) NSNumber *amountOfRooms;

@end

@implementation

- (BOOL)validateAmountOfRooms:(id *)ioValue error:(NSError *)error
{
    RSValidator *numberValidator = [RSValidator validatorForNumber];
    RSValidator *rangeValidator = [RSValidator validatorWithBlock:^BOOL(id obj, NSError *__autoreleasing *error) {
        NSUInteger value = [obj unsignedIntegerValue];
        if (value >= 3 && value <= 6) {
            return YES;
        } else {
            return NO;
        }
    }];

    RSValidator *compoundValidator = [RSValidator andValidatorForValidators:@[numberValidator, rangeValidator]];

    return [compoundValidator validateObject:*ioValue error:error];
}

@end

```

Even though this example might be verbose and not useful it shows the possiblities and usage of ValidationKit. The validator
objects are immutable and thread-safe. They can be used to validate different properties from different classes.

