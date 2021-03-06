# Lecture 10: Core Data

### Core Data
- Works by creating a visual mapping between database and objects
- Create and query for objects using object-oriented API

### Creating Core Data

##### Creating Core Data file:
- New File -> iOS - Core Data - Data Model
// This creates .xcdatamodelId file

##### Adding an Entity:
- Click on "Add Entity"
- Each entity includes:
	- Attributes
		- Sort of like properties
		- Each attribute needs a type
	- Relationships
		- Properties that point to other objects in the database
	- Fetched Properties
		- Properties that can be queried

##### Adding a Relationship between entities:
- Control drag from one entity to another
- Types of relationships:
	- Many-to-Many
	- One-to-Many
	- One-to-One
- Delete Rule:
	- Determines what happens to the pointed-to objects if we delete pointed-from objects

	Nullify: Set the pointer to nil

### Using Core Data

##### Two ways to access Core Data:
- Sharing a global NSManagedObjectContext in your AppDelegate:
	1. Click "Use Core Data" when you create a project
	(This adds code to your ApplDelegate, including 'managedObjectContext')
	2. Access:
	```swift
		UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
	```
	\* If you have an existing project, create a new project and copy the AppDelegate code over

- UIManagedDocument:
	- Asynchronous
	- Autosaves themselves, but if you wanna manually save:
	```swift
	// Call this on the main queue
	document.saveToURL(document.fileURL, forSaveOperation: .ForOverwriting) { success in ...}
	```
				
	- Automatically closes if there are no strong pointers left to it, but if you wanna manually close it:
	```swift
		document.closeWithCompletionHandler { success in ... }
	```

	*How to use:*
		1. Check if UIManagedDocument is open or not
		```swift
		if document.documentState == .Normal{
			/* use managedObjectContext */
		}
		```

		2. If you need to create/open one, check to see if UIManagedDocument's underlying file exists on disk
		```swift
		if let path = fileURL.path,
		let fileExists = NSFileManager.defaultManager().fileExistsAtPath(path){	...	}

		// Opening the document
		document.openWithCompletionHandler{ (success: Bool) in /* use managedObjectContext */ }
		// Creating the document
		document.saveToURL(document.fileURL, forSaveOperation: .ForCreating){ success in ... }
		```

		```
		let fm = NSFileManager.defaultManager()
		if let docsDir = fm.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first{
			let url = docsDir.URLByAppendingPathComponent("MyDocumentName")
			let document = UIManagedDocument(fileURL: url)
		}
		```
