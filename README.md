# A Cupertino Yankee in Scott Forstall's Court

**An NSDate Category With Locale-Aware Calculations for Beginning & End of Day, Week, Month, and Year**

## Usage

```objective-c
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

## License

MIT

## Contact

Mattt ([@mattt](https://twitter.com/mattt))
