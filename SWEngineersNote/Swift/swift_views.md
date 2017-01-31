# Swift: Views
## View Rendering Hierarchy


## Shadowing Technique
### The Naive Way
```swift
view.layer.shadowColor = UIColor.black.cgColor
view.layer.shadowOffset = CGSize(width: 3, height: 3)
view.layer.shadowOpacity = 0.7
view.layer.shadowRadius = 4.0
```

Shadowing this way can be very expensive in terms of performance. Also, shadow layer might get cut off if masking is used on the view.

### Better ways
#### What if there are sublayers or subviews whose content we want to clip to the bounds of our view?
```swift
// add the shadow to the base view
baseView.backgroundColor = UIColor.clear
baseView.layer.shadowColor = UIColor.black.cgColor
baseView.layer.shadowOffset = CGSize(width: 3, height: 3)
baseView.layer.shadowOpacity = 0.7
baseView.layer.shadowRadius = 4.0

// add the border to subview
let borderView = UIView()
borderView.frame = baseView.bounds
borderView.layer.cornerRadius = 10
borderView.layer.borderColor = UIColor.black.cgColor
borderView.layer.borderWidth = 1.0
borderView.layer.masksToBounds = true
baseView.addSubview(borderView)

// add any other subcontent that you want clipped
let otherSubContent = UIImageView()
otherSubContent.image = UIImage(named: "lion")
otherSubContent.frame = borderView.bounds
borderView.addSubview(otherSubContent)
```

#### Better Performance
Use a pre-defined path for the shadow and specify it to be rasterized.

```swift
baseView.layer.shadowPath = UIBezierPath(roundedRect: baseView.bounds, cornerRadius: 10).cgPath
baseView.layer.shouldRasterize = true
baseView.layer.rasterizationScale = UIScreen.main.scale
```

## Reference
- [UIView with Shadow](http://stackoverflow.com/questions/4754392/uiview-with-rounded-corners-and-drop-shadow)
- [Blog post on Rounded UIView with shadow, the right way](https://damir.me/rounded-uiview-with-shadow-the-right-way)