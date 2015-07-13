# A Cupertino Yankee in Scott Forstall's Court

**An NSDate Category With Locale-Aware Calculations for Beginning, End, Next & Previous of Day, Week, Month, and Year**

> **Thompson's Law**: Any code that performs sufficiently complex date calculations using naïve arithmetic means has a non-zero chance of causing a Y2K-style collapse of the global technology infrastructure.

If your code defines `kSecondsInDay`, `kSecondsInWeek`--or worst of all--`kSecondsInMonth` (seriously, what would you set for that?)... you may want to reconsider. Date and time systems are [really, really complicated](http://infiniteundo.com/post/25326999628/falsehoods-programmers-believe-about-time). Between all of the [time zones](http://en.wikipedia.org/wiki/List_of_time_zones_by_country), [calendars](http://en.wikipedia.org/wiki/List_of_calendars) and other locale-specific information you should be prepared for, you really can't get it right yourself.

Thank `$DEITY` for `NSCalendar` is all I'm saying.

Anyway, this library uses `NSCalendar` and `NSDateComponents` exclusively for date calculation, so you'll handle everything from [leap years](http://en.wikipedia.org/wiki/Leap_year) to [leap months](http://en.wikipedia.org/wiki/Hebrew_calendar#Leap_months) like a champ.

## Usage

``` objective-c
NSLog(@"Current Time:       %@", date);
NSLog(@"Beginning of Day:   %@", [date beginningOfDay]);
NSLog(@"End of Day:         %@", [date endOfDay]);
NSLog(@"Next Day:           %@", [date nextDay]);
NSLog(@"Previous Day:       %@", [date previousDay]);
NSLog(@"Beginning of Week:  %@", [date beginningOfWeek]);
NSLog(@"End of Week:        %@", [date endOfWeek]);
NSLog(@"Next Week:          %@", [date nextWeek]);
NSLog(@"Previous Week:      %@", [date previousWeek]);
NSLog(@"Beginning of Month: %@", [date beginningOfMonth]);
NSLog(@"End of Month:       %@", [date endOfMonth]);
NSLog(@"Next Month:         %@", [date nextMonth]);
NSLog(@"Previous Month:     %@", [date previousMonth]);
NSLog(@"Beginning of Year:  %@", [date beginningOfYear]);
NSLog(@"End of Year:        %@", [date endOfYear]);
NSLog(@"Next Year:          %@", [date nextYear]);
NSLog(@"Previous Year:      %@", [date previousYear]);
```

Result (Note the Time Zone and Daylight Savings Offsets)

```
Current Time:       2015-07-13 14:26:08 +0000
Beginning of Day:   2015-07-12 22:00:00 +0000
End of Day:         2015-07-13 21:59:59 +0000
Next Day:           2015-07-14 14:26:08 +0000
Previous Day:       2015-07-12 14:26:08 +0000
Beginning of Week:  2015-07-12 22:00:00 +0000
End of Week:        2015-07-19 21:59:59 +0000
Next Week:          2015-07-20 14:26:08 +0000
Previous Week:      2015-07-06 14:26:08 +0000
Beginning of Month: 2015-06-30 22:00:00 +0000
End of Month:       2015-07-31 21:59:59 +0000
Next Month:         2015-08-13 14:26:08 +0000
Previous Month:     2015-06-13 14:26:08 +0000
Beginning of Year:  2014-12-31 23:00:00 +0000
End of Year:        2015-12-31 22:59:59 +0000
Next Year:          2016-07-13 14:26:08 +0000
Previous Year:      2014-07-13 14:26:08 +0000

```

## Contact

Mattt Thompson

- http://github.com/mattt
- http://twitter.com/mattt
- m@mattt.me

## License

"A Cupertino Yankee in Scott Forstall's Court" is available under the MIT license. See the LICENSE file for more info.
