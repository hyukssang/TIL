//
//  ViewController.swift
//  RealmTodo
//
//  Created by Sang Hyuk Cho on 1/17/17.
//  Copyright © 2017 sang. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

	@IBOutlet weak var tableView: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		// Move Realm database to a new place inside the App Groups
		let directory: URL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: groupID)!
		let fileURL = directory.appendingPathComponent(dbName)
		self.realm = try! Realm(fileURL: fileURL)
		print("file url \(realm.configuration.fileURL)")
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	// Realm object for accessing database
	var realm: Realm!
	// For results we will get from database
	var todoList: Results<TodoItem>{
		get{
			return realm.objects(TodoItem.self)
		}
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.todoList.count
	}
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath)
		let item = self.todoList[indexPath.row]
		cell.textLabel?.text = item.detail
		cell.detailTextLabel?.text = "\(item.status)"
		return cell
	}
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let item = self.todoList[indexPath.row]
		// Change objects on Realm when row selected
		try! self.realm.write({
			if item.status == 0{
				item.status = 1
			}
			else{
				item.status = 0
			}
		})
		tableView.reloadRows(at: [indexPath], with: .automatic)
	}
	func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		return true
	}
	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete{
			let item = self.todoList[indexPath.row]
			try! self.realm.write({ 
				self.realm.delete(item)
			})
			tableView.deleteRows(at: [indexPath], with: .automatic)
		}
	}
	
	@IBAction func addNew(_ sender: Any) {
		let alertController = UIAlertController(title: "Add New List!", message: "What's your next plan?", preferredStyle: .alert)
		alertController.addTextField { (textfield) in
			
		}
		let cancellingAction = UIAlertAction(title: "Cancel", style: .cancel) { (alertAction) in
			
		}
		let addingAction = UIAlertAction(title: "Add", style: .default) { (alertAction) in
			// Get textfield from alertController
			let textfield = (alertController.textFields?.first)! as UITextField
			// Create an instance for the textfield data above
			let todoItem = TodoItem()
			todoItem.detail = textfield.text!
			todoItem.status = 0
			// Add to Realm when prompted
			try! self.realm.write({ 
				self.realm.add(todoItem)
				self.tableView.insertRows(at: [IndexPath(row: self.todoList.count-1, section: 0)], with: .automatic)
			})
		}
		alertController.addAction(cancellingAction)
		alertController.addAction(addingAction)
		present(alertController, animated: true, completion: nil)
	}
}

