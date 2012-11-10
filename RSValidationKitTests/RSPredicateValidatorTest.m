#import <GHUnitIOS/GHUnit.h>
#import "RSPredicateValidator.h"

@interface RSPredicateValidatorTest : GHTestCase

@property (nonatomic, strong) RSPredicateValidator *predicateValidator;

@end

@implementation RSPredicateValidatorTest

- (void)setUp
{
    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        return [[evaluatedObject objectForKey:@"foo"] isEqual:@"bar"];
    }];
    self.predicateValidator = [[RSPredicateValidator alloc] initWithPredicate:predicate];
}

- (void)testReturnsYESWhenPredicateMatched
{
    NSDictionary *dictionary = @{@"foo" : @"bar"};
    GHAssertEquals(YES, [self.predicateValidator validateObject:dictionary error:NULL], @"Should return YES when predicate-matching object passed");
}

- (void)testReturnsNOWhenNonNilPassed
{
    NSDictionary *dictionary = @{@"foo" : @"234bar"};
    GHAssertEquals(NO, [self.predicateValidator validateObject:dictionary error:NULL], @"Should return NO when non-predicate-matching object passed");
}

- (void)testReturnsErrorWhenNonStringPassed
{
    NSDictionary *dictionary = @{@"foo" : @"baradsf"};

    NSError *error = nil;
    [self.predicateValidator validateObject:dictionary error:&error];

    GHAssertNotNil(error, @"Should return an error when non-predicate-matching object is passed");
}

@end