# A Cupertino Yankee in Scott Forstall's Court
**An NSDate Category With Locale-Aware Calculations for Beginning & End of Day, Week, Month, and Year**

> **Thompson's Law**: Any code that performs sufficiently complex date calculations using naïve arithmetic means has a non-zero chance of causing a Y2K-style collapse of the global technology infrastructure.

If your code defines `kSecondsInDay`, `kSecondsInWeek`--or worst of all--`kSecondsInMonth` (seriously, what would you set for that?)... you may want to reconsider. Date and time systems are [really, really complicated](http://infiniteundo.com/post/25326999628/falsehoods-programmers-believe-about-time). Between all of the [time zones](http://en.wikipedia.org/wiki/List_of_time_zones_by_country), [calendars](http://en.wikipedia.org/wiki/List_of_calendars) and other locale-specific information you should be prepared for, you really can't get it right yourself.

Thank `$DEITY` for `NSCalendar` is all I'm saying. Anyway, this library uses `NSCalendar` and `NSDateComponents` exclusively for date calculation, so you'll handle everything from [leap years](http://en.wikipedia.org/wiki/Leap_year) to [leap months](http://en.wikipedia.org/wiki/Hebrew_calendar#Leap_months) like a champ.

## Example Usage

``` objective-c
NSLog(@"Current Time: %@", date);
NSLog(@"Beginning of Day:%@", [date beginningOfDay]);
NSLog(@"End of Day:%@", [date endOfDay]);
NSLog(@"Beginning of Week:%@", [date beginningOfWeek]);
NSLog(@"End of Week:%@", [date endOfWeek]);
NSLog(@"Beginning of Month:%@", [date beginningOfMonth]);
NSLog(@"End of Month:%@", [date endOfMonth]);
NSLog(@"Beginning of Year:%@", [date beginningOfYear]);
NSLog(@"End of Year:%@", [date endOfYear]);
```

Result (Note the Time Zone and Daylight Savings Offsets)

```
Current Time: 2013-10-19 13:29:26 +0000
Beginning of Day: 2013-10-18 22:00:00 +0000
End of Day: 2013-10-19 21:59:59 +0000
Beginning of Week: 2013-10-12 22:00:00 +0000
End of Week: 2013-10-19 21:59:59 +0000
Beginning of Month: 2013-09-30 22:00:00 +0000
End of Month: 2013-10-31 22:59:59 +0000
Beginning of Year: 2012-12-31 23:00:00 +0000
End of Year: 2013-12-31 22:59:59 +0000
```

## Contact

Mattt Thompson

- http://github.com/mattt
- http://twitter.com/mattt
- m@mattt.me

## License

"A Cupertino Yankee in Scott Forstall's Court" is available under the MIT license. See the LICENSE file for more info.
