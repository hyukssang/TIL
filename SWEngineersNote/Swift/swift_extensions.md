# Swift: Useful Extensions

## UIColor
### Hex Strings for `UIColor`
```swift
extension UIColor {
    convenience init(colorWithHexValue value: Int, alpha:CGFloat = 1.0){
        self.init(
            red: CGFloat((value & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((value & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(value & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}
```

```swift
let white = UIColor(colorWithHexValue: 0xECEAED)
```

## String
### Getting estimated height for a text block
```swift
extension NSString{
	func getEstimatedHeight(with width: CGFloat, font: UIFont) -> CGFloat{
		let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
		let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
		
		return ceil(boundingBox.height)
	}
}
```