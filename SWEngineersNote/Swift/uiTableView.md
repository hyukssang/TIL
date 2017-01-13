# UITableView

### Useful Tips

##### Dynamically adjusting heights of cells based on the heights of subviews
1. Add constraints to each of the subviews, with the subview at the bottom-most anchored to bottomAnchor of its superview

2. Implement two of the `UITableView` delegate functions, returning `UITableViewAutomaticDimension` in both:
	- `func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat`
	- `func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat`

---

##### Removing empty space before the tableview when used with a Navigation controller

**Using Interface Builder**
1. Select the view controller
2. Open `Attributes` inspector
3. Uncheck `Adjust scroll view insets`

**Programmatically**
```
self.automaticallyAdjustsScrollViewInsets = false
```

From: <br/>[stackoverflow: Remove empty space before cells in UITableView ](http://stackoverflow.com/questions/18906919/remove-empty-space-before-cells-in-uitableview)

---
