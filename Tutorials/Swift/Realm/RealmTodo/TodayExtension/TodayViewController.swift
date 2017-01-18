//
//  TodayViewController.swift
//  TodayExtension
//
//  Created by Sang Hyuk Cho on 1/17/17.
//  Copyright © 2017 sang. All rights reserved.
//

import UIKit
import NotificationCenter
import RealmSwift

class TodayViewController: UIViewController, NCWidgetProviding, UITableViewDataSource {
	
	var realm: Realm!
	var todoList: Results<TodoItem>{
		get{
			return realm.objects(TodoItem.self)
		}
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
		
		// Get Realm object from the shared App Group space
		let directory = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: groupID)!
		let fileURL = directory.appendingPathComponent(dbName)
		realm = try! Realm(fileURL: fileURL)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
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
}
