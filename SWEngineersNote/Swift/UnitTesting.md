# Unit Testing with XCode, Swift

### Background
With Unit Testing, you are checking if a certain chunk of code does its job (like a single method). It is done by providing the unit of code as an input value, allowing that value to run through the code, and then checking to see if the output value is what we expect it to be.

### Creating Unit Testing files

When you create a new project, select "Include Unit Tests". This creates a class inherited from `XCTestCase` class.

### Procedure

1. Setup variables to use for Unit Testing inside `setUp()` method:

	```swift
	var vc: ViewController!

	override func setUp() {
	    super.setUp()

	    let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
	    vc = storyboard.instantiateInitialViewController() as! ViewController
	}
	```
2. Create a test method that starts with the keyword `test`:

	```swift
	func testPercentageCalculator(){

	}
	```

3. Using `XCTAssert(expression: Bool)`, test if a function returns proper output:

	```
	func testPercentageCalculator(){
		let p = vc.percentage(50, 50)
		XCTAssert(p == 25)
	}
	```
This code example tests `percentage` method inside `vc`. If `p` gets the value it should get, `XCTAssert` would return `true`, thus passing the test.

4. Run the test by clicking on the little square on the side. Each test method has a square button on the side

<br/>

*Note 1: If using multiple `XCTAssert`: You can have a message appear for each `XCTAssert` upon failing each test.*

*Note 2: Outlets might cause an error, because for tests `loadView()` is not called, returning nil. In this case, use `let _ = vc.view`, which triggers all the required methods, but simply not `loadView()` method.*

### Reference
http://www.appcoda.com/unit-testing-swift/
