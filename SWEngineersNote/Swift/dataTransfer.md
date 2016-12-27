# Data Transfer Across Different Screens

### Using Delegates

##### Running Functions in the parent ViewController

1. Create a protocol with functions to be run inside the child ViewController, and
declare an instance of the protocol inside the child ViewController (perhaps with `weak` reference)

```
protocol childViewControllerDelegate: class {
	func selected(deck: Deck)
}
```

```
weak var delegate: childViewControllerDelegate?
```

2. Implement the functions defined in the protocol inside the parent ViewController

```
func selected(deck: Deck) {
	self.selectedDeck = deck
	reloadConfigurationItems()
	popConfigurationViewController()
}
```

3. Before making a transition to the child ViewController, set the delegate variable
inside the child ViewController to self (parent ViewController), so that now the functions
defined in the delegate/protocol uses the functions implemented in the parent

```
let vc = childViewController()
vc.delegate = self
self.pushConfigurationViewController(vc)
```

4. Call the function in the child ViewController through the delegate variable

```
delegate?.selected(deck: self.userDecks[indexPath.row])
```
