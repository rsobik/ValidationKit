#import <GHUnitIOS/GHUnit.h>
#import "RSCompoundOrValidator.h"
#import "RSPredicateValidator.h"
#import "RSClassValidator.h"

@interface RSCompoundOrValidatorTest : GHTestCase

@property (nonatomic, strong) RSCompoundOrValidator *compoundOrValidator;

@end

@implementation RSCompoundOrValidatorTest

- (void)setUp
{
    RSClassValidator *stringValidator = [[RSClassValidator alloc] initWithClass:[NSString class]];
    RSPredicateValidator *predicateValidator = [[RSPredicateValidator alloc] initWithPredicate:[NSPredicate predicateWithFormat:@"@length > 2"]];

    self.compoundOrValidator = [[RSCompoundOrValidator alloc] initWithValidators:@[stringValidator, predicateValidator]];
}

- (void)testReturnsYESWhenOneValidatorMatches
{
    GHAssertEquals(YES, [self.compoundOrValidator validateObject:@"1" error:NULL], @"Should return YES when one validator passes");
}

- (void)testRetursYESWhenAllValidatorsMatch
{
    GHAssertEquals(YES, [self.compoundOrValidator validateObject:@"123" error:NULL], @"Should return YES when all validators pass.");
}

- (void)testReturnsNOWhenAllValidatorsFail
{
    GHAssertEquals(NO, [self.compoundOrValidator validateObject:@1 error:NULL], @"Should return NO when all validators fail.");
}

- (void)testReturnsErrorWhenAllValidatorsFail
{
    NSError *error = nil;
    [self.compoundOrValidator validateObject:@1 error:&error];

    GHAssertNotNil(error, @"Should return an error object when all validatons fail.");
}

@end