#import <GHUnitIOS/GHUnit.h>
#import "RSClassValidator.h"

@interface RSClassValidatorTest : GHTestCase

@property (nonatomic, strong) RSClassValidator *classValidator;

@end

@implementation RSClassValidatorTest

- (void)setUp
{
    self.classValidator = [[RSClassValidator alloc] initWithClass:[NSString class]];
}

- (void)testReturnsYESWhenStringPassed
{
    GHAssertEquals(YES, [self.classValidator validateObject:@"" error:NULL], @"Should return YES when String passed");
}

- (void)testReturnsNOWhenNonStringPassed
{
    GHAssertEquals(NO, [self.classValidator validateObject:@35 error:NULL], @"Should return NO when non-String passed");
}

- (void)testReturnsErrorWhenNonStringPassed
{
    NSError *error = nil;
    [self.classValidator validateObject:@43 error:&error];

    GHAssertNotNil(error, @"Should return an error when non-String passed");
}

@end