# Screen Transition

### Storyboard

##### Using`present` method
1. Create a new instance of next ViewController or instantiate it from the Storyboard

2. Initialize and/or transfer data required by the new ViewController  

3. `present` it (or use `pushViewController` if current ViewController is embedded in a NavigationController)

###### Example

```
	let nextVC = UIViewController()
	self.present(nextVC, animated: true, completion: nil)
	// or
	let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "nextViewController")
	self.present(nextVC, animated: true, completion: nil)
``` 

**Creating a new instance of the next VC vs Instantiating the next VC from the Storyboard :** 

The first method works if there is no data to be sent over and/or view is initialized programmatically. 

The second method works for the case where the view of the next ViewController is loaded from the Storyboard. (Watch out for the order the variables in the next ViewController get initiated. Variables like `UITableView` might not have been initiated to be able to set `dataSource` and `delegate` to the ViewController)

### Reference
[stackoverflow: Instantiate View Controller from Storyboard vs. Creating New Instance](http://stackoverflow.com/questions/26131693/instantiate-view-controller-from-storyboard-vs-creating-new-instance)