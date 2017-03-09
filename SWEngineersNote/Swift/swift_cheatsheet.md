# Swift: Cheat Sheet
## I/O
### Methods
`readLine(strippingNewline: Bool = default)`
- Returns a string read from standard input through the end of the current line or until EOF is reached.

## String
### Methods
`init(repeating: String, count: Int)`
- Creates a new string representing the given string repeated the specific number of times

`components(separatedBy: String)`
- Returns an array containing substrings from the `String` that have been divided by a given separator

## Array & Range
### Methods
`append(Element)`
- Adds a new element at the end of the array

`popLast()`
- Removes and returns the last element of the array

`reversed()`
- Returns elements of a collection in reverse order
```swift
// Prints 9, 8, 7, ..., 0
for i in (0..<10).reversed(){
	print(i)
}
```

`sorted()`
- Returns the elements of the collection, sorted
- Note that this method does not actually change the order of the elements in the array

`sort()`
- Sorts the collection in place

`max()`
- Returns the maximum element in the sequence

`min()`
- Returns the maximum element in the sequence

`index(of: Element)`
- Returns the first index where the specified value appears in the collection