# Navigation Controller & Related

## Navigation Bar

#### How to make a transparant `UINavigationBar`
1. Set `backgroundImage` attribute of the navigation bar to an "empty" `UIImage` with bar metric `default`
2. Also set `shadowImage` attribute to an "empty" `UIImage`. Note that custom `shadowImage` only works with custom `backgroundImage`, otherwise, it is set to default.
3. Set `translucent` attribute to true, meaning we want a transparent navigation bar
4. Set `backgroundColor` attribute to `clearColor`

Code example:
```
self.navigationController.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
self.navigationController.navigationBar.shadowImage = UIImage()
self.navigationController.navigationBar.translucent = true
self.navigationController.view.backgroundColor = UIColor.clearColor()
```

#### If you want to make contents (ie. `UIImageView`) to overlap with `UINavigationBar`
1. Set `UIViewController`'s attribute `automaticallyAdjustsScrollViewInsets` to `false`
