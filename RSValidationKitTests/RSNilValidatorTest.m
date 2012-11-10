#import <GHUnitIOS/GHUnit.h>
#import "RSNilValidator.h"

@interface RSNilValidatorTest : GHTestCase

@property (nonatomic, strong) RSNilValidator *nilValidator;

@end

@implementation RSNilValidatorTest

- (void)setUp
{
    self.nilValidator = [[RSNilValidator alloc] init];
}

- (void)testReturnsYESWhenNilPassed
{
    GHAssertEquals(YES, [self.nilValidator validateObject:nil error:NULL], @"Should return YES when nil passed");
}

- (void)testReturnsNOWhenNonNilPassed
{
    GHAssertEquals(NO, [self.nilValidator validateObject:@35 error:NULL], @"Should return NO when non-nil passed");
}

- (void)testReturnsErrorWhenNonStringPassed
{
    NSError *error = nil;
    [self.nilValidator validateObject:@43 error:&error];

    GHAssertNotNil(error, @"Should return an error when non-nil passed");
}

@end