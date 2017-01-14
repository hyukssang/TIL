# UILabel

### Useful Tips

##### Underlining a part of text
1. Create an instance of NSMutableAttributedString to store the whole text

	```
	let allText = NSMutableAttributedString()
	```

2. For the part of text you want to underline, create an instance of NSAttributedString
with attributes set and append it to the string you created at step 1:

	```
	let underlinedString = NSAttributedString(string: originalString, attributes: [NSUnderlineStyleAttributeName: NSUnderlineStyle.styleSingle.rawValue])
	allText.append(underlinedString)
	```

3. Assign the string to `attributedText` property of a `UILabel`

	```
	label.attributedText = allText
	```
