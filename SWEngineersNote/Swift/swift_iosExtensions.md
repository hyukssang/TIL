# iOS Extension

## Share Extension

### Creating an Extension for the First Time
Click on the project on *Project Navigator* and create a new extension by hitting **New > File > Target > {Extension of your choice}**

By default, the extension contains a view with two buttons *Cancel* and *Post* on the navigation bar, *textarea* in the middle, and *table cells* (`configurationItems`) on the bottom.

### Accessing a Webpage
In Share extensions (on both platforms) and Action extensions (iOS only), you can:
- Give users access to web content by asking Safari to run a JavaScript file and return the results to the extension
- Use the JavaScript file to access a webpage before your extension runs (on both platforms)
- Access or modify the webpage after your extension completes its task (iOS only)

To add webpage access and manipulation to your app extension, perform the following steps:

1. Create a JavaScript file that includes a global object named `ExtensionPreprocessingJS`. Assign a new instance of your custom JavaScript class to this object.
2. In the NSExtensionActivationRule dictionary in your app extension’s Info.plist file, give the `NSExtensionActivationSupportsWebPageWithMaxCount` key a nonzero value.
3. When your app extension starts, use the `NSItemProvider` class to get the results returned by the execution of the JavaScript file.
4. In an iOS app extension, pass values to the JavaScript file if you want Safari to modify the webpage when your extension completes its task. (You use the `NSItemProvider` class in this step, too.)

To tell Safari that your app extension includes a JavaScript file, add the `NSExtensionJavaScriptPreprocessingFile` key to the `NSExtensionAttributes` dictionary. The value of the key should be the file that you want Safari to load before your extension starts. For example:
```
<key>NSExtensionAttributes</key>
	<dict>
		<key>NSExtensionActivationRule</key>
		<dict>
			<key>NSExtensionActivationSupportsWebPageWithMaxCount</key>
			<integer>1</integer>
		</dict>
		<key>NSExtensionJavaScriptPreprocessingFile</key>
		<string>GetURL</string>		// GetURL.js
	</dict>
```

On both platforms, your custom JavaScript class can define a `run()` function that Safari invokes as soon as it loads the JavaScript file. In the `run()` function, Safari provides an argument named `completionFunction`, with which you can pass results to your app extension in the form of a key-value object.

In iOS, you can also define a `finalize()` function that Safari invokes when your app extension calls `completeRequestReturningItems:completion:` at the end of its task. A `finalize()` function can use items your extension passes in `completeRequestReturningItems:completion:` to change the webpage as desired.

For example:
```
var MyExtensionJavaScriptClass = function() {};

MyExtensionJavaScriptClass.prototype = {
    run: function(arguments) {
    // Pass the baseURI of the webpage to the extension.
        arguments.completionFunction({"baseURI": document.baseURI});
    },

// Note that the finalize function is only available in iOS.
    finalize: function(arguments) {
        // arguments contains the value the extension provides in [NSExtensionContext completeRequestReturningItems:completion:].
    // In this example, the extension provides a color as a returning item.
    document.body.style.backgroundColor = arguments["bgColor"];
    }
};

// The JavaScript file must contain a global object named "ExtensionPreprocessingJS".
var ExtensionPreprocessingJS = new MyExtensionJavaScriptClass;
```

To retrieve results and perform some logic with the results:

```
override func viewDidLoad() {
	let extensionItem = extensionContext?.inputItems.first as! NSExtensionItem

	// Where we will receive results from JS file
	let itemProvider = extensionItem.attachments?.first as! NSItemProvider
	let propertyList = String(kUTTypePropertyList)

	// Check if results from JS file are available
	if itemProvider.hasItemConformingToTypeIdentifier(propertyList){
		// Receive results from JS file
		itemProvider.loadItem(forTypeIdentifier: propertyList, options: nil, completionHandler: { (item, error) -> Void in
				guard let dictionary = item as? NSDictionary else { return }
				OperationQueue.main.addOperation {
					if let results = dictionary[NSExtensionJavaScriptPreprocessingResultsKey] as? NSDictionary, let urlString = results["URL"] as? String, let url = NSURL(string: urlString) {
						print("URL retrieved:  \(urlString)")
					}
				}
			})
	}
	else{
		print("error")
	}
}
```

### Adding Table cells at the bottom: `configurationItems`

Override the given func `configurationItems()`
1. For each item(cell), declare `SLComposeSheetConfigurationItem`
2. Set the `title` and the `value` of each item
3. Define operations to run on tap
4. Return the items in an `Array`

Example:
```
override func configurationItems() -> [Any]! {
    // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
	let item1 = SLComposeSheetConfigurationItem()
	item1?.title = "Selected Deck"
	item1?.value = "Deck Title"
	item1?.tapHandler = {
		// on tap

	}
	let item2 = SLComposeSheetConfigurationItem()
	item2?.title = "Selected Deck"
	item2?.value = "Deck Title"
	item2?.tapHandler = {
		// on tap

	}
	return [item1, item2]
}
```

### Finishing Up

Implement `didSelectPost()`

## Reference
[Apple App Extension Guide](https://developer.apple.com/library/content/documentation/General/Conceptual/ExtensibilityPG/ExtensionScenarios.html#//apple_ref/doc/uid/TP40014214-CH21-SW8)
