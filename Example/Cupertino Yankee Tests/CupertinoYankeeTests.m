// CupertinoYankeeTests.m
//
// Copyright (c) 2012–2014 Mattt Thompson (http://mattt.me)
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

#import <Foundation/Foundation.h>
#import <XCTest/XCTest.h>

#import "NSDate+CupertinoYankee.h"

static NSDate * CYDateFromString(NSString *string) {
    static NSDateFormatter *_dateFormatter = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _dateFormatter = [[NSDateFormatter alloc] init];
        _dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
        _dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZZZZZ";
    });

    return [_dateFormatter dateFromString:string];
}

@interface CupertinoYankeeTests : XCTestCase
@property (nonatomic, copy) NSDate *date;
@end

@implementation CupertinoYankeeTests

- (void)setUp {
    [super setUp];

    [NSTimeZone setDefaultTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];

    self.date = CYDateFromString(@"2012-07-19 14:30:45 +0000");
}

#pragma mark -

- (void)testDate {
    XCTAssertNotNil(self.date);
}

- (void)testBeginningOfDay {
	XCTAssertEqualObjects([self.date beginningOfDay], CYDateFromString(@"2012-07-19 00:00:00 +0000"));
}

- (void)testEndOfDay {
	XCTAssertEqualObjects([self.date endOfDay], CYDateFromString(@"2012-07-19 23:59:59 +0000"));
}

- (void)testBeginningOfWeekIsFirstWeekday {
    NSDate *today = [NSDate date];
    NSDate *beginningOfTodaysWeek = [today beginningOfWeek];

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated"
    NSDateComponents *weekdayComponent = [[NSCalendar currentCalendar] components:NSWeekdayCalendarUnit fromDate:beginningOfTodaysWeek];
#pragma clang diagnostic pop
    XCTAssertEqual([[NSCalendar currentCalendar] firstWeekday], (NSUInteger)weekdayComponent.weekday);
}

- (void)testBeginningOfWeek {
	XCTAssertEqualObjects([self.date beginningOfWeek], CYDateFromString(@"2012-07-15 00:00:00 +0000"));
}

- (void)testEndOfWeek {
	XCTAssertEqualObjects([self.date endOfWeek], CYDateFromString(@"2012-07-21 23:59:59 +0000"));
}

- (void)testBeginningOfMonth {
	XCTAssertEqualObjects([self.date beginningOfMonth], CYDateFromString(@"2012-07-01 00:00:00 +0000"));
}

- (void)testEndOfMonth {
	XCTAssertEqualObjects([self.date endOfMonth], CYDateFromString(@"2012-07-31 23:59:59 +0000"));
}

- (void)testBeginningOfYear {
	XCTAssertEqualObjects([self.date beginningOfYear], CYDateFromString(@"2012-01-01 00:00:00 +0000"));
}

- (void)testEndOfYear {
	XCTAssertEqualObjects([self.date endOfYear], CYDateFromString(@"2012-12-31 23:59:59 +0000"));
}

@end
