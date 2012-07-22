//
//  CupertinoYankeeTests.m
//  CupertinoYankeeTests
//
//  Created by Zach Waugh on 7/19/12.
//

#import "CupertinoYankeeTests.h"
#import "NSDate+CupertinoYankee.h"

@implementation CupertinoYankeeTests

- (void)testBeginningOfDay
{
	// Thursday, July 19, 2012 2:30:45 PM
	NSDate *date = [NSDate dateWithString:@"2012-07-19 14:30:45 -0400"];

	// Should be Thursday, July 19, 2012 at 12:00:00 AM
	STAssertEqualObjects([date beginningOfDay], [NSDate dateWithString:@"2012-07-19 00:00:00 -0400"], nil);
	
	// Thursday, July 19, 2012 11:59:59 PM
	date = [NSDate dateWithString:@"2012-07-19 23:59:59 -0400"];
	
	// Should be Thursday, July 19, 2012 at 12:00:00 AM
	STAssertEqualObjects([date beginningOfDay], [NSDate dateWithString:@"2012-07-19 00:00:00 -0400"], nil);
	
	// Thursday, July 19, 2012 12:00:01 PM
	date = [NSDate dateWithString:@"2012-07-19 00:00:01 -0400"];
	
	// Should be Thursday, July 19, 2012 at 12:00:00 AM
	STAssertEqualObjects([date beginningOfDay], [NSDate dateWithString:@"2012-07-19 00:00:00 -0400"], nil);
}

- (void)testEndOfDay
{
	// Thursday, July 19, 2012 2:30:45 PM
	NSDate *date = [NSDate dateWithString:@"2012-07-19 14:30:45 -0400"];

	// Should be Thursday, July 19, 2012 at 11:59:59 PM
	STAssertEqualObjects([date endOfDay], [NSDate dateWithString:@"2012-07-19 23:59:59 -0400"], nil);
	
	// Thursday, July 19, 2012 11:59:00 PM
	date = [NSDate dateWithString:@"2012-07-19 23:59:00 -0400"];
	
	// Should be Thursday, July 19, 2012 at 11:59:59 PM
	STAssertEqualObjects([date endOfDay], [NSDate dateWithString:@"2012-07-19 23:59:59 -0400"], nil);
}

- (void)testBeginningOfWeek
{
	// Thursday, July 19, 2012 2:30:45 PM
	NSDate *date = [NSDate dateWithString:@"2012-07-19 14:30:45 -0400"];
	
	// Should be Monday, July 16, 2012 at 12:00:00 AM
	STAssertEqualObjects([date beginningOfWeek], [NSDate dateWithString:@"2012-07-16 00:00:00 -0400"], nil);
	
	// Also test Sunday since that's a special case
	// Sunday, July 22, 2012 2:30:45 PM
	date = [NSDate dateWithString:@"2012-07-22 14:30:45 -0400"];

	// Should be Monday, July 16, 2012 at 12:00:00 AM
	STAssertEqualObjects([date beginningOfWeek], [NSDate dateWithString:@"2012-07-16 00:00:00 -0400"], nil);
	
	// Monday, July 16, 2012 2:30:45 PM
	date = [NSDate dateWithString:@"2012-07-16 14:30:45 -0400"];
	
	// Should be Monday, July 16, 2012 at 12:00:00 AM
	STAssertEqualObjects([date beginningOfWeek], [NSDate dateWithString:@"2012-07-16 00:00:00 -0400"], nil);
}

- (void)testEndOfWeek
{
	// Thursday, July 19, 2012 2:30:45 PM
	NSDate *date = [NSDate dateWithString:@"2012-07-19 14:30:45 -0400"];

	// Should be Sunday, July 22, 2012 at 11:59:59 PM
	STAssertEqualObjects([date endOfWeek], [NSDate dateWithString:@"2012-07-22 23:59:59 -0400"], nil);
	
	// Sunday, July 22, 2012 2:30:45 PM
	date = [NSDate dateWithString:@"2012-07-22 14:30:45 -0400"];

	// Should be Sunday, July 22, 2012 at 11:59:59 PM
	STAssertEqualObjects([date endOfWeek], [NSDate dateWithString:@"2012-07-22 23:59:59 -0400"], nil);
	
	// Monday, July 16, 2012 12:00:00 AM
	date = [NSDate dateWithString:@"2012-07-16 00:00:00 -0400"];
	
	// Should be Sunday, July 22, 2012 at 11:59:59 PM
	STAssertEqualObjects([date endOfWeek], [NSDate dateWithString:@"2012-07-22 23:59:59 -0400"], nil);
}

- (void)testBeginningOfMonth
{
	// Thursday, July 19, 2012 2:30:45 PM
	NSDate *date = [NSDate dateWithString:@"2012-07-19 14:30:45 -0400"];
	
	// Should be July 1, 2012 at 12:00:00 AM
	STAssertEqualObjects([date beginningOfMonth], [NSDate dateWithString:@"2012-07-01 00:00:00 -0400"], nil);
	
	// February 27, 2012 2:30:45 PM
	date = [NSDate dateWithString:@"2012-02-27 14:30:45 -0500"];
	
	// Should be February 1, 2012 at 12:00:00 AM
	STAssertEqualObjects([date beginningOfMonth], [NSDate dateWithString:@"2012-02-01 00:00:00 -0500"], nil);
}

- (void)testEndOfMonth
{
	// Thursday, July 19, 2012 2:30:45 PM
	NSDate *date = [NSDate dateWithString:@"2012-07-19 14:30:45 -0400"];	

	// Should be July 31, 2012 at 11:59:59 AM
	STAssertEqualObjects([date endOfMonth], [NSDate dateWithString:@"2012-07-31 23:59:59 -0400"], nil);
}

- (void)testBeginningOfYear
{
	// Thursday, July 19, 2012 2:30:45 PM
	NSDate *date = [NSDate dateWithString:@"2012-07-19 14:30:45 -0400"];
	
	// Should be January 1, 2012 at 12:00:00 AM
	// Note: changed timezone to take daylight savings time into account
	STAssertEqualObjects([date beginningOfYear], [NSDate dateWithString:@"2012-01-01 00:00:00 -0500"], nil);
}

- (void)testEndOfYear
{
	// Thursday, July 19, 2012 2:30:45 PM
	NSDate *date = [NSDate dateWithString:@"2012-07-19 14:30:45 -0400"];
	
	// Should be December 31, 2012 at 11:59:59 PM
	// Note: changed timezone (from -0400 to -0500) to take daylight savings time into account
	STAssertEqualObjects([date endOfYear], [NSDate dateWithString:@"2012-12-31 23:59:59 -0500"], nil);
}

@end
