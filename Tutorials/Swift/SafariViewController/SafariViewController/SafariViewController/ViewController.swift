//
//  ViewController.swift
//  SafariViewController
//
//  Created by Sang Hyuk Cho on 12/24/16.
//  Copyright © 2016 sang. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func openSafari(_ sender: Any) {
		let url = URL(string: "https://www.google.com")
		let safariVC = SFSafariViewController(url: url!)
		self.present(safariVC, animated: true, completion: nil)
	}

}

