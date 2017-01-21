# Swift: Date

## Objects Commonly Used
- `Calendar`
Encapsulates information about systems of reckoning time in which the beginning, length, and divisions of a year are defined. It provides information about the calendar and support for calendrical computations such as determining the range of a given calendrical unit and adding units to a given absolute time.

- `Date`
Represents a single point in time

- `DateFormatter`
Instances of `NSDateFormatter` create string representations of `NSDate` objects, and convert textual representations of dates and times into `NSDate` objects. For user-visible representations of dates and times, `NSDateFormatter` provides a variety of localized presets and configuration options. For fixed format representations of dates and times, you can specify a custom format string.

- `DateComponents`
Encapsulates the components of a date in an extendable, structured manner

- `DateComponentsFormatter`
An `NSDateComponentsFormatter` object takes quantities of time and formats them as a user-readable string. Use a date components formatter to create strings for your app’s interface. The formatter object has many options for creating both abbreviated and expanded strings. The formatter takes the current user’s locale and language into account when generating strings.

## Usage
### Getting the current date
```swift
// "Jan 18, 2017, 5:22 PM"
let currentDate = Date()
```

### Formatting a date string
Create an instance of `DateFormatter`:
```
let dateFormatter = DateFormatter()
```

By default, `DateFormatter` uses the local device's settings.

#### Locale
```
dateFormatter.locale = Locale(identifier: "el_GR")
```

#### String Format
##### Method #1: Using one of the given format:
```
// Assume current date is "Jan 18, 2017, 3:31 PM"
// "Wednesday, January 18, 2017"
dateFormatter.dateStyle = DateFormatter.Style.full
var convertedDate = dateFormatter.string(from: currentDate)

// "January 18, 2017"
dateFormatter.dateStyle = DateFormatter.Style.long
convertedDate = dateFormatter.string(from: currentDate)

// "Jan 18, 2017"
dateFormatter.dateStyle = DateFormatter.Style.medium
convertedDate = dateFormatter.string(from: currentDate)

// "1/18/17"
dateFormatter.dateStyle = DateFormatter.Style.short
convertedDate = dateFormatter.string(from: currentDate)

// ""
dateFormatter.dateStyle = DateFormatter.Style.none
convertedDate = dateFormatter.string(from: currentDate)
```

##### Method #2: Specifying a custom format:
```
// Custom style, "15:31:06"
dateFormatter.dateFormat = "HH:mm:ss"
convertedDate = dateFormatter.string(from: currentDate)
```

### String (Static date) -> Date conversion
#### Method #1: Using `DateFormatter`
```
// String -> Date, "Dec 24, 2015, 11:59 PM"
var dateInput = "24-12-2015 23:59"
dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
var dateOutput = dateFormatter.date(from: dateInput)

// "Oct 8, 2015, 2:22 AM"
dateInput = "Thu, 08 Oct 2015 09:22:33 GMT"
dateFormatter.dateFormat = "EEE, dd MMM yyyy HH:mm:ss zzz"
dateOutput = dateFormatter.date(from: dateInput)
```

**!!** String given for `dateFormat` **must match** the string provided as date:
```
// Since no format is specified for Hour and Minute, returns nil
var dateInput = "24-12-2015 23:59"
dateFormatter.dateFormat = "dd-MM-yyyy"
var dateOutput = dateFormatter.date(from: dateInput)
```

#### Method #2: Using `DateComponents`
```
// Date Components -> Date object
var components = DateComponents()
components.day = 5
components.month = 01
components.year = 2016
components.hour = 19
components.minute = 30
components.timeZone = TimeZone(abbreviation: "GMT")
let newDate = calendar.date(from: components)
```

### Comparing two dates
#### Method #1: Using `date.compare()`
```
dateFormatter.dateFormat = "MMM dd, yyyy zzz"
var dateString = "Oct 08, 2015 GMT"
var date1 = dateFormatter.date(from: dateString)!

dateString = "Oct 10, 2015 GMT"
var date2 = dateFormatter.date(from: dateString)!

// Returns "ascending"
if date1.compare(date2) == .orderedAscending{
	print("ascending")
}
else if date1.compare(date2) == .orderedDescending{
	print("descending")
}
else{
	print("equal")
}
```

#### Method #2: Using `TimeInterval` between two dates
```
// Returns "Date1 is Earlier than Date2\n"
if date1.timeIntervalSinceReferenceDate > date2.timeIntervalSinceReferenceDate {
	print("Date1 is Later than Date2")
}
else if date1.timeIntervalSinceReferenceDate <  date2.timeIntervalSinceReferenceDate {
	print("Date1 is Earlier than Date2")
}
else {
	print("Same dates")
}
```

### Calculating difference between two dates
#### Method #1: `Calendar.current.dateComponents()`
```
dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
dateString = "2015-10-08 14:25:37"
date1 = dateFormatter.date(from: dateString)!

dateString = "2018-03-05 08:14:19"
date2 = dateFormatter.date(from: dateString)!

// later date: dateTo, earlier date: dateFrom = positive value
// Returns "2 years, 4 months, 24 days, 17 hours, 48 minutes, 42 seconds"
var diffDateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date1, to: date2)
```

#### Method #2: `TimeInterval` between two dates
```
// Returns "2 years, 4 months, 24 days, 17 hours, 48 minutes, 42 seconds"
let dateComponentsFormatter = DateComponentsFormatter()
dateComponentsFormatter.unitsStyle = .full

let interval = date2.timeIntervalSince(date1)
dateComponentsFormatter.string(from: interval)
```

#### Method #2: `DateComponentsFormatter`
```
dateComponentsFormatter.allowedUnits = [.year, .month, .day, .hour, .minute, .second]
let autoFormattedDifference = dateComponentsFormatter.string(from: date1, to: date2)
```

### Adding / Subtracting dates
#### Method #1: Make consequent calls to add dates
```
var calculatedDate = Calendar.current.date(byAdding: Calendar.Component.month, value: monthsToAdd, to: currentDate)
calculatedDate = Calendar.current.date(byAdding: Calendar.Component.day, value: daysToAdd, to: calculatedDate!)
```

#### Method #2: Add components to a date
```
var newDateComponents = DateComponents()
newDateComponents.month = monthsToAdd
newDateComponents.day = daysToAdd
calculatedDate = Calendar.current.date(byAdding: newDateComponents, to: currentDate)
```

## Reference
- [Appcoda: NSDate](http://appcoda.com/nsdate/)