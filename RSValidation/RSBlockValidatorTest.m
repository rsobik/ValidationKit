#import <GHUnitIOS/GHUnit.h>
#import "RSBlockValidator.h"

@interface RSBlockValidatorTest : GHTestCase

@property (nonatomic, strong) RSBlockValidator *blockValidator;

@end

@implementation RSBlockValidatorTest

- (void)setUp
{
    self.blockValidator = [[RSBlockValidator alloc] initWithBlock:^BOOL(id object, NSError *__autoreleasing *error) {
        BOOL isValid = [object isEqual:@"foo"];

        if (!isValid && error) {
            *error = [NSError errorWithDomain:@"someerro" code:0 userInfo:nil];
        }

        return isValid;
    }];
}

- (void)testReturnsYESWhenBlockReturnsYES
{
    GHAssertEquals(YES, [self.blockValidator validateObject:@"foo" error:NULL], @"Should return YES block returns YES");
}

- (void)testReturnsNOWhenBlockReturnsNO
{
    GHAssertEquals(NO, [self.blockValidator validateObject:@"foobar" error:NULL], @"Should return NO block returns NO");
}

- (void)testReturnsErrorWhenBlockReturnsNO
{
    NSError *error = nil;
    [self.blockValidator validateObject:@"foogar" error:&error];

    GHAssertNotNil(error, @"Should return an error when non-predicate-matching object is passed");
}

@end