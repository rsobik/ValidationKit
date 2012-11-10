#import <GHUnitIOS/GHUnit.h>
#import "RSCompoundAndValidator.h"
#import "RSPredicateValidator.h"
#import "RSClassValidator.h"

@interface RSCompoundAndValidatorTest : GHTestCase

@property (nonatomic, strong) RSCompoundAndValidator *compoundAndValidator;

@end

@implementation RSCompoundAndValidatorTest

- (void)setUp
{
    RSClassValidator *stringValidator = [[RSClassValidator alloc] initWithClass:[NSString class]];

    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        return [evaluatedObject isEqual:@"foo"];
    }];
    RSPredicateValidator *predicateValidator = [[RSPredicateValidator alloc] initWithPredicate:predicate];

    self.compoundAndValidator = [[RSCompoundAndValidator alloc] initWithValidators:@[stringValidator, predicateValidator]];
}

- (void)testRetursYESWhenAllValidatorsMatch
{
    GHAssertEquals(YES, [self.compoundAndValidator validateObject:@"foo" error:NULL], @"Should return YES when all validators pass.");
}

- (void)testReturnsNOWhenOneValidatorFails
{
    GHAssertEquals(NO, [self.compoundAndValidator validateObject:@"1" error:NULL], @"Should return NO when all validators fail.");
}

- (void)testReturnsErrorWhenOneValidatorFails
{
    NSError *error = nil;
    [self.compoundAndValidator validateObject:@"2" error:&error];

    GHAssertNotNil(error, @"Should return an error object when all validatons fail.");
}

@end