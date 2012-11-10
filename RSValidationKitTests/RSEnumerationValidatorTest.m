#import <GHUnitIOS/GHUnit.h>

#import "RSEnumerationValidator.h"
#import "RSClassValidator.h"


@interface RSEnumeratorValidatorTest : GHTestCase

@property (nonatomic, strong) RSEnumerationValidator *enumerationValidator;

@end

@implementation RSEnumeratorValidatorTest

- (void)setUp
{
    RSClassValidator *stringValidator = [[RSClassValidator alloc] initWithClass:[NSString class]];
    self.enumerationValidator = [[RSEnumerationValidator alloc] initWithValidator:stringValidator];;
}

- (void)testReturnsYESWhenAppliedWithSetOfStrings
{
    NSSet *set = [NSSet setWithObjects:@"foo", @"bar", nil];
    GHAssertEquals(YES, [self.enumerationValidator validateObject:set error:NULL],
                   @"Should return YES when set with correct objects is passed");
}

- (void)testReturnsYESWhenAppliedWithArrayOfStrings
{
    NSArray *array = [NSArray arrayWithObjects:@"foo", @"bar", nil];
    GHAssertEquals(YES, [self.enumerationValidator validateObject:array error:NULL],
                   @"Should return YES when array with correct objects is passed");
}

- (void)testReturnsNOWhenANonCorrectObjectIsInCollection
{
    NSArray *arrray = @[@"string", @234, @"string"];
    GHAssertEquals(NO, [self.enumerationValidator validateObject:arrray error:NULL],
                   @"Should return NO when a non-correct object is in collection");
}

- (void)testReturnsErrorWhenANonCorrectObjectIsInCollection
{
    NSArray *arrray = @[@"string", @234, @"string"];

    NSError *error = nil;
    [self.enumerationValidator validateObject:arrray error:&error];

    GHAssertNotNil(error, @"Should return an error when non-correct object is in collection");
}

@end