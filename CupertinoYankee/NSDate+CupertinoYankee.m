// NSDate+CupertinoYankee.m
//
// Copyright (c) 2012–2014 Mattt Thompson (http://mattt.me)
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

#import "NSDate+CupertinoYankee.h"

#if (defined(__IPHONE_OS_VERSION_MAX_ALLOWED) && __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000) || (defined(__MAC_OS_X_VERSION_MAX_ALLOWED) && __MAC_OS_X_VERSION_MAX_ALLOWED >= 1090)
#define CYCalendarUnitYear NSCalendarUnitYear
#define CYCalendarUnitMonth NSCalendarUnitMonth
#define CYCalendarUnitWeek NSCalendarUnitWeekOfYear
#define CYCalendarUnitDay NSCalendarUnitDay
#define CYCalendarUnitHour NSCalendarUnitHour
#define CYCalendarUnitMinute NSCalendarUnitMinute
#define CYCalendarUnitSecond NSCalendarUnitSecond
#define CYCalendarUnitWeekday NSCalendarUnitWeekday
#define CYDateComponentUndefined NSDateComponentUndefined
#else
#define CYCalendarUnitYear NSYearCalendarUnit
#define CYCalendarUnitMonth NSMonthCalendarUnit
#define CYCalendarUnitWeek NSWeekOfYearCalendarUnit
#define CYCalendarUnitDay NSDayCalendarUnit
#define CYCalendarUnitHour NSHourCalendarUnit
#define CYCalendarUnitMinute NSMinuteCalendarUnit
#define CYCalendarUnitSecond NSSecondCalendarUnit
#define CYCalendarUnitWeekday NSWeekdayCalendarUnit
#define CYDateComponentUndefined NSUndefinedDateComponent
#endif

@implementation NSDate (CupertinoYankee)

- (NSDate *)beginningOfDay {
    NSCalendar *calendar = [NSCalendar currentCalendar];

    NSDateComponents *components = [calendar components:CYCalendarUnitYear | CYCalendarUnitMonth | CYCalendarUnitDay fromDate:self];
    
    return [calendar dateFromComponents:components];
}

- (NSDate *)endOfDay {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.day = 1;
    
    return [[calendar dateByAddingComponents:components toDate:[self beginningOfDay] options:0] dateByAddingTimeInterval:-1];
}

#pragma mark -

- (NSDate *)beginningOfWeek {
    NSCalendar *calendar = [NSCalendar currentCalendar];

    NSDateComponents *components = [calendar components:CYCalendarUnitYear | CYCalendarUnitMonth | CYCalendarUnitWeekday | CYCalendarUnitDay fromDate:self];

    NSInteger offset = components.weekday - (NSInteger)calendar.firstWeekday;
    components.day = components.day - offset;

    return [calendar dateFromComponents:components];
}

- (NSDate *)endOfWeek {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.weekOfMonth = 1;

    return [[calendar dateByAddingComponents:components toDate:[self beginningOfWeek] options:0] dateByAddingTimeInterval:-1];
}

#pragma mark -

- (NSDate *)beginningOfMonth {
    NSCalendar *calendar = [NSCalendar currentCalendar];

    NSDateComponents *components = [calendar components:CYCalendarUnitYear | CYCalendarUnitMonth fromDate:self];
        
    return [calendar dateFromComponents:components];
}

- (NSDate *)endOfMonth {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.month = 1;
    
    return [[calendar dateByAddingComponents:components toDate:[self beginningOfMonth] options:0] dateByAddingTimeInterval:-1];
}

#pragma mark -

- (NSDate *)beginningOfYear {
    NSCalendar *calendar = [NSCalendar currentCalendar];

    NSDateComponents *components = [calendar components:CYCalendarUnitYear fromDate:self];
    
    return [calendar dateFromComponents:components];
}

- (NSDate *)endOfYear {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.year = 1;

    return [[calendar dateByAddingComponents:components toDate:[self beginningOfYear] options:0] dateByAddingTimeInterval:-1];
}

@end
