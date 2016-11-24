# Layout Constraints

### Constraints using NSLayoutConstraint (traditional way)

### Constraints using Anchors

### Constraints using VFL (Visual Format Language)

##### Available Symbols

H	: indicates horizontal orientation

V	: indicates vertical orientation

|	: superview

\-	: spacing

==	: equal widths

<= 	: less than equal to

\>=	: greater than equal to

@[number]	: priority from 0 to 1000, 1000 being the highest priority

\- [number] - : non-standard spacing (in this case 20points)


**Code Example:**
```
let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat:
	"V:|-[titleLabel(==20)]-[separatorView(==1)]-[folderNameLabel(==20)]-[folderNameTextField(==20)]-[folderColorLabel(==20)]-[colorCollectionView]", options: [], metrics: nil, views: views)
```


### Reference
http://useyourloaf.com/blog/pain-free-constraints-with-layout-anchors/

http://commandshift.co.uk/blog/2013/01/31/visual-format-language-for-autolayout/
