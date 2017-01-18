//
//  ShareViewController.swift
//  ShareExtension
//
//  Created by Sang Hyuk Cho on 12/25/16.
//  Copyright © 2016 sang. All rights reserved.
//

import UIKit
import Social
import MobileCoreServices

class ShareViewController: SLComposeServiceViewController, ShareSelectViewControllerDelegate {

	private var urlString: String?
	var userDecks = [Deck]()
	
	var selectedDeck: Deck?
	
	// Define the function to call when a tableViewCell in ShareSelectVC gets selected
	func selected(deck: Deck) {
		self.selectedDeck = deck
		reloadConfigurationItems()
		popConfigurationViewController()
	}
	
    override func isContentValid() -> Bool {
        // Do validation of contentText and/or NSExtensionContext attachments here
        return true
    }

    override func didSelectPost() {
        // This is called after the user selects Post. Do the upload of contentText and/or NSExtensionContext attachments.
    
        // Inform the host that we're done, so it un-blocks its UI. Note: Alternatively you could call super's -didSelectPost, which will similarly complete the extension context.
        self.extensionContext!.completeRequest(returningItems: [], completionHandler: nil)
    }

    override func configurationItems() -> [Any]! {
        // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
		let item = SLComposeSheetConfigurationItem()
		item?.title = "Selected Deck"
		item?.value = self.selectedDeck?.title
		
		item?.tapHandler = {
			// on tap
			let vc = ShareSelectViewController()
			vc.userDecks = self.userDecks
			// ShareSelectViewControllerDelegate functions defined inside ShareViewController
			vc.delegate = self
			self.pushConfigurationViewController(vc)
		}
		return [item]
    }

	override func viewDidLoad() {
		// dummy data
		for i in 1...3 {
			let deck = Deck()
			deck.title = "Deck \(i)"
			userDecks.append(deck)
		}
		self.selectedDeck = self.userDecks.first
		
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
							self.urlString = urlString
						}
					}
				})
		}
		else{
			print("error")
		}
	}
}
