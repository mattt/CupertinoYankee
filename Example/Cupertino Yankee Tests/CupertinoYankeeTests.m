// CupertinoYankeeTests.m
//
// Copyright (c) 2012 Mattt Thompson (http://mattt.me)
// Created by Zach Waugh (http://zachwaugh.com)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "CupertinoYankeeTests.h"
#import "NSDate+CupertinoYankee.h"

@implementation CupertinoYankeeTests

+ (void)setUp {
    [NSTimeZone setDefaultTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
}

- (void)testBeginningOfDay {
	// Thursday, July 19, 2012 2:30:45 PM
	NSDate *date = [NSDate dateWithString:@"2012-07-19 14:30:45 +0000"];

	// Should be Thursday, July 19, 2012 at 12:00:00 AM
	STAssertEqualObjects([date beginningOfDay], [NSDate dateWithString:@"2012-07-19 00:00:00 +0000"], nil);
	
	// Thursday, July 19, 2012 11:59:59 PM
	date = [NSDate dateWithString:@"2012-07-19 23:59:59 +0000"];
	
	// Should be Thursday, July 19, 2012 at 12:00:00 AM
	STAssertEqualObjects([date beginningOfDay], [NSDate dateWithString:@"2012-07-19 00:00:00 +0000"], nil);
	
	// Thursday, July 19, 2012 12:00:01 PM
	date = [NSDate dateWithString:@"2012-07-19 00:00:01 +0000"];
	
	// Should be Thursday, July 19, 2012 at 12:00:00 AM
	STAssertEqualObjects([date beginningOfDay], [NSDate dateWithString:@"2012-07-19 00:00:00 +0000"], nil);
}

- (void)testEndOfDay {
	// Thursday, July 19, 2012 2:30:45 PM
	NSDate *date = [NSDate dateWithString:@"2012-07-19 14:30:45 +0000"];

	// Should be Thursday, July 19, 2012 at 11:59:59 PM
	STAssertEqualObjects([date endOfDay], [NSDate dateWithString:@"2012-07-19 23:59:59 +0000"], nil);
	
	// Thursday, July 19, 2012 11:59:00 PM
	date = [NSDate dateWithString:@"2012-07-19 23:59:00 +0000"];
	
	// Should be Thursday, July 19, 2012 at 11:59:59 PM
	STAssertEqualObjects([date endOfDay], [NSDate dateWithString:@"2012-07-19 23:59:59 +0000"], nil);
}

- (void)testBeginningOfWeekIsFirstWeekday
{
    // NSCalendar's -firstWeekday defines when the week begins,
    // therefore the date returned by -beginningOfWeek should have its weekday == firstWeekday
    // E.g. in certain locale's the first day of the week is Sunday (firstWeekday == 1),
    // but in a different it may be Monday (firstWeekday == 2)
    NSDate *today = [NSDate date];
    NSDate *beginningOfTodaysWeek = [today beginningOfWeek];
    NSDateComponents *weekdayComponent = [[NSCalendar currentCalendar] components:NSWeekdayCalendarUnit fromDate:beginningOfTodaysWeek];
    STAssertEquals([[NSCalendar currentCalendar] firstWeekday], (NSUInteger)weekdayComponent.weekday, nil);
}

- (void)testBeginningOfWeek {
	// Thursday, July 19, 2012 2:30:45 PM
	NSDate *date = [NSDate dateWithString:@"2012-07-19 14:30:45 +0000"];
	
	// Should be Monday, July 16, 2012 at 12:00:00 AM
	STAssertEqualObjects([date beginningOfWeek], [NSDate dateWithString:@"2012-07-16 00:00:00 +0000"], nil);
	
	// Also test Sunday since that's a special case
	// Sunday, July 22, 2012 2:30:45 PM
	date = [NSDate dateWithString:@"2012-07-22 14:30:45 +0000"];

	// Should be Monday, July 16, 2012 at 12:00:00 AM
	STAssertEqualObjects([date beginningOfWeek], [NSDate dateWithString:@"2012-07-16 00:00:00 +0000"], nil);
	
	// Monday, July 16, 2012 2:30:45 PM
	date = [NSDate dateWithString:@"2012-07-16 14:30:45 +0000"];
	
	// Should be Monday, July 16, 2012 at 12:00:00 AM
	STAssertEqualObjects([date beginningOfWeek], [NSDate dateWithString:@"2012-07-16 00:00:00 +0000"], nil);
}

- (void)testEndOfWeek {
	// Thursday, July 19, 2012 2:30:45 PM
	NSDate *date = [NSDate dateWithString:@"2012-07-19 14:30:45 +0000"];

	// Should be Sunday, July 22, 2012 at 11:59:59 PM
	STAssertEqualObjects([date endOfWeek], [NSDate dateWithString:@"2012-07-22 23:59:59 +0000"], nil);
	
	// Sunday, July 22, 2012 2:30:45 PM
	date = [NSDate dateWithString:@"2012-07-22 14:30:45 +0000"];

	// Should be Sunday, July 22, 2012 at 11:59:59 PM
	STAssertEqualObjects([date endOfWeek], [NSDate dateWithString:@"2012-07-22 23:59:59 +0000"], nil);
	
	// Monday, July 16, 2012 12:00:00 AM
	date = [NSDate dateWithString:@"2012-07-16 00:00:00 +0000"];
	
	// Should be Sunday, July 22, 2012 at 11:59:59 PM
	STAssertEqualObjects([date endOfWeek], [NSDate dateWithString:@"2012-07-22 23:59:59 +0000"], nil);
}

- (void)testBeginningOfMonth {
	// Thursday, July 19, 2012 2:30:45 PM
	NSDate *date = [NSDate dateWithString:@"2012-07-19 14:30:45 +0000"];
	
	// Should be July 1, 2012 at 12:00:00 AM
	STAssertEqualObjects([date beginningOfMonth], [NSDate dateWithString:@"2012-07-01 00:00:00 +0000"], nil);
	
	// February 27, 2012 2:30:45 PM
	date = [NSDate dateWithString:@"2012-02-27 14:30:45 +0000"];
	
	// Should be February 1, 2012 at 12:00:00 AM
	STAssertEqualObjects([date beginningOfMonth], [NSDate dateWithString:@"2012-02-01 00:00:00 +0000"], nil);
}

- (void)testEndOfMonth {
	// Thursday, July 19, 2012 2:30:45 PM
	NSDate *date = [NSDate dateWithString:@"2012-07-19 14:30:45 +0000"];	

	// Should be July 31, 2012 at 11:59:59 AM
	STAssertEqualObjects([date endOfMonth], [NSDate dateWithString:@"2012-07-31 23:59:59 +0000"], nil);
}

- (void)testBeginningOfYear {
	// Thursday, July 19, 2012 2:30:45 PM
	NSDate *date = [NSDate dateWithString:@"2012-07-19 14:30:45 +0000"];
	
	// Should be January 1, 2012 at 12:00:00 AM
	// Note: changed timezone to take daylight savings time into account
	STAssertEqualObjects([date beginningOfYear], [NSDate dateWithString:@"2012-01-01 00:00:00 +0000"], nil);
}

- (void)testEndOfYear {
	// Thursday, July 19, 2012 2:30:45 PM
	NSDate *date = [NSDate dateWithString:@"2012-07-19 14:30:45 +0000"];
	
	// Should be December 31, 2012 at 11:59:59 PM
	// Note: changed timezone (from +0000 to +0000) to take daylight savings time into account
	STAssertEqualObjects([date endOfYear], [NSDate dateWithString:@"2012-12-31 23:59:59 +0000"], nil);
}

@end
