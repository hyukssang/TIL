# Swift: Formatter
## NumberFormatter
### Tricks
#### Keeping Trailing Zeros on a Double
```swift
let numberFormatter = NumberFormatter()
numberFormatter.minimumFractionDigits = 6
// Returns ".533000"
let output = numberFormatter.string(from: NSNumber(value: 0.533))!
```