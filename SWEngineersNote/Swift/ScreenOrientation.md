## Screen Orientation

#### If you do not want to allow transition
1. Click on the project inside Project Navigator
2. Targets > General > Device Orientation, selecte the modes you want to support

<!-- #### Using `UIScrollView` and embed contentView (`UIView`) -->


#### Using `willTransition` Function

**Code Example**
```
	override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator){
		// sample code
		collectionView.collectionViewLayout.invalidateLayout()

		let indexPath = IndexPath(item: pageControl.currentPage, section: 0)
		DispatchQueue.main.async{
			self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
			// Prepare images for landscape mode so that when we rotate
			// we just need to change the image and reloadData
			self.collectionView.reloadData()
		}
	}
```

#### Reference
[Youtube - Let's build that app](https://www.youtube.com/watch?v=YY06LNJ1mGY)
