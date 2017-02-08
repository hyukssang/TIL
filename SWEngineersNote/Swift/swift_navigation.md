# Swift: Navigation

## Navigating Between Different View Controllers
### Using `present`
1. Create a new instance of next ViewController or instantiate it from the Storyboard

2. Initialize and/or transfer data required by the new ViewController  

3. `present` it (or use `pushViewController` if current ViewController is embedded in a NavigationController)

```
	// Method #1
	let nextVC = UIViewController()
	self.present(nextVC, animated: true, completion: nil)

	// Method #2
	let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "nextViewController")
	self.present(nextVC, animated: true, completion: nil)
``` 

**Creating a new instance of the next VC vs Instantiating the next VC from the Storyboard :** 

The first method works if there is no data to be sent over and/or view is initialized programmatically (Otherwise, you would get a black screen, because subviews aren't initialized). 

The second method works for the case where the view of the next ViewController is loaded from the Storyboard. (Watch out for the order the variables in the next ViewController get initiated. Variables like `UITableView` might not have been initiated to be able to set `dataSource` and `delegate` to the ViewController)


## Navigation Controller

### Tricks
#### Setting the Title
```swift
self.navigationItem.title = "String"
```

#### Transparant `UINavigationBar`
1. Set `backgroundImage` attribute of the navigation bar to an "empty" `UIImage` with bar metric `default`
2. Also set `shadowImage` attribute to an "empty" `UIImage`. Note that custom `shadowImage` only works with custom `backgroundImage`, otherwise, it is set to default.
3. Set `translucent` attribute to true, meaning we want a transparent navigation bar
4. Set `backgroundColor` attribute to `clearColor`


```
self.navigationController.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
self.navigationController.navigationBar.shadowImage = UIImage()
self.navigationController.navigationBar.translucent = true
self.navigationController.view.backgroundColor = UIColor.clearColor()
```

#### If you want to make contents (ie. `UIImageView`) to overlap with `UINavigationBar`

Set `UIViewController`'s attribute `automaticallyAdjustsScrollViewInsets` to `false`

This also solves the case where you have `UICollectionView` and/or `UITableView` within the same `UIViewController` and the `UICollectionView` and/or `UITableView` have margins at the top to account for the space created by navigation bar.

## Reference
- [stackoverflow: Instantiate View Controller from Storyboard vs. Creating New Instance](http://stackoverflow.com/questions/26131693/instantiate-view-controller-from-storyboard-vs-creating-new-instance)

