//
//  ShareSelectViewController.swift
//  ShareExtensionDemo
//
//  Created by Sang Hyuk Cho on 12/27/16.
//  Copyright © 2016 sang. All rights reserved.
//

import UIKit

// For calling functions in another ViewController
protocol ShareSelectViewControllerDelegate: class {
	func selected(deck: Deck)
}

class ShareSelectViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

	lazy var tableView: UITableView = {
		let tableView = UITableView(frame: self.view.frame)
		tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		tableView.delegate = self
		tableView.dataSource = self
		tableView.backgroundColor = .clear
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "deckCell")
		return tableView
	}()
	
	var userDecks = [Deck]()
	weak var delegate: ShareSelectViewControllerDelegate?
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		// Customize navigation bar
		navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
		title = "Select Deck"
		view.addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	
	// Tableview Delegate, Data Source
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return userDecks.count
	}
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "deckCell", for: indexPath)
		cell.textLabel?.text =
			userDecks[indexPath.row].title
		cell.backgroundColor = .clear
		return cell
	}
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		// Call the functiond defined in ShareVC
		delegate?.selected(deck: self.userDecks[indexPath.row])
	}
}
