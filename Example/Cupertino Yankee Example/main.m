// main.m
//
// Copyright (c) 2012 Mattt Thompson (http://mattt.me)
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

#import "NSDate+CupertinoYankee.h"

int main (int argc, const char * argv[]) {
    @autoreleasepool {
        NSDate *date = [NSDate date];
        NSLog(@"Current Time: %@", date);
        NSLog(@"Beginning of Day:%@", [date beginningOfDay]);
        NSLog(@"End of Day:%@", [date endOfDay]);
        NSLog(@"Beginning of Week:%@", [date beginningOfWeek]);
        NSLog(@"End of Week:%@", [date endOfWeek]);
        NSLog(@"Beginning of Month:%@", [date beginningOfMonth]);
        NSLog(@"End of Month:%@", [date endOfMonth]);
        NSLog(@"Beginning of Year:%@", [date beginningOfYear]);
        NSLog(@"End of Year:%@", [date endOfYear]);
    }
    
    return 0;
}

