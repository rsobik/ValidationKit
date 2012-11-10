#import <GHUnitIOS/GHUnit.h>

#import "RSEnumerationValidator.h"
#import "RSNotValidator.h"
#import "RSNilValidator.h"


@interface RSNotValidatorTest : GHTestCase

@property (nonatomic, strong) RSNotValidator *notValidator;

@end

@implementation RSNotValidatorTest

- (void)setUp
{
    RSNilValidator *nilValidator = [[RSNilValidator alloc] init];
    self.notValidator = [[RSNotValidator alloc] initWithValidator:nilValidator];
}

- (void)testReturnsNOWhenAppliedWithNil
{
    GHAssertEquals(NO, [self.notValidator validateObject:nil error:NULL],
                   @"Should return NO when nil is passed");
}

- (void)testReturnsYESWhenAppliedWithAObject
{
    GHAssertEquals(YES, [self.notValidator validateObject:@"object" error:NULL],
                   @"Should return YES when no-nil is passed");
}

- (void)testReturnsErrorWhenANonCorrectObjectIsInCollection
{
    NSError *error = nil;
    [self.notValidator validateObject:@"foo" error:&error];

    GHAssertNotNil(error, @"Should return an error when non-correct object is in collection");
}

@end