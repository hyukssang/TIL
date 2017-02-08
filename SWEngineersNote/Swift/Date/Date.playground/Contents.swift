//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// "Jan 18, 2017, 5:22 PM"
let currentDate = Date()
// Uses local device settings by default
let dateFormatter = DateFormatter()

// Change locale setting
//dateFormatter.locale = Locale(identifier: "el_GR")

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

// Change format of the date
dateFormatter.dateFormat = "HH:mm:ss"
convertedDate = dateFormatter.string(from: currentDate)

// String -> Date, "Dec 24, 2015, 11:59 PM"
var dateInput = "24-12-2015 23:59"
dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
var dateOutput = dateFormatter.date(from: dateInput)

// "Oct 8, 2015, 2:22 AM"
dateInput = "Thu, 08 Oct 2015 09:22:33 GMT"
dateFormatter.dateFormat = "EEE, dd MMM yyyy HH:mm:ss zzz"
dateOutput = dateFormatter.date(from: dateInput)

// Returns user's current calendar
let calendar = Calendar.current
// Returns all the date components of a date, using the calendar time zone
let dateComponents = calendar.dateComponents([Calendar.Component.day, Calendar.Component.month, Calendar.Component.year, Calendar.Component.weekOfYear, Calendar.Component.hour, Calendar.Component.minute, Calendar.Component.second], from: currentDate)

// Date Components -> Date object
var components = DateComponents()
components.day = 5
components.month = 01
components.year = 2016
components.hour = 19
components.minute = 30
components.timeZone = TimeZone(abbreviation: "GMT")
let newDate = calendar.date(from: components)

// Comparing two dates
dateFormatter.dateFormat = "MMM dd, yyyy zzz"
var dateString = "Oct 08, 2015 GMT"
var date1 = dateFormatter.date(from: dateString)!

dateString = "Oct 10, 2015 GMT"
var date2 = dateFormatter.date(from: dateString)!

// Comparing dates - Method #1
if date1.compare(date2) == .orderedAscending{
	print("ascending")
}
else if date1.compare(date2) == .orderedDescending{
	print("descending")
}
else{
	print("equal")
}

// Comparing dates - Method #2
if date1.timeIntervalSinceReferenceDate > date2.timeIntervalSinceReferenceDate {
	print("Date1 is Later than Date2")
}
else if date1.timeIntervalSinceReferenceDate <  date2.timeIntervalSinceReferenceDate {
	print("Date1 is Earlier than Date2")
}
else {
	print("Same dates")
}

//Calculating the difference between dates
dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
dateString = "2015-10-08 14:25:37"
date1 = dateFormatter.date(from: dateString)!

dateString = "2018-03-05 08:14:19"
date2 = dateFormatter.date(from: dateString)!

// Method #1
// dateTo - dateFrom = positive
var diffDateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date1, to: date2)
print("The difference between dates is: \(diffDateComponents.year) years, \(diffDateComponents.month) months, \(diffDateComponents.day) days, \(diffDateComponents.hour) hours, \(diffDateComponents.minute) minutes, \(diffDateComponents.second) seconds")

// Method #2
let dateComponentsFormatter = DateComponentsFormatter()
dateComponentsFormatter.unitsStyle = .full

let interval = date2.timeIntervalSince(date1)
dateComponentsFormatter.string(from: interval)

// Method #3
dateComponentsFormatter.allowedUnits = [.year, .month, .day, .hour, .minute, .second]
let autoFormattedDifference = dateComponentsFormatter.string(from: date1, to: date2)

// Adding dates
let monthsToAdd = 0
let daysToAdd = 53
// Method #1: Consequent calls to add dates
var calculatedDate = Calendar.current.date(byAdding: Calendar.Component.month, value: monthsToAdd, to: currentDate)
calculatedDate = Calendar.current.date(byAdding: Calendar.Component.day, value: daysToAdd, to: calculatedDate!)
// Method #2: Add Components to a date
var newDateComponents = DateComponents()
newDateComponents.month = monthsToAdd
newDateComponents.day = daysToAdd
calculatedDate = Calendar.current.date(byAdding: newDateComponents, to: currentDate)

// Testing
let testDate = Date()
let currentMonthComponents = Calendar.current.dateComponents([.year, .month], from: testDate)
Calendar.current.date(from: currentMonthComponents)