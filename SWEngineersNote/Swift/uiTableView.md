# UITableView

### Useful Tips

##### Dynamically adjusting heights of cells based on the heights of subviews
1. Add constraints to each of the subviews, with the subview at the bottom-most anchored to bottomAnchor of its superview

2. Implement two of the `UITableView` delegate functions, returning `UITableViewAutomaticDimension` in both:
	- `func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat`
	- `func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat`
