//
//  TodoItem.swift
//  RealmTodo
//
//  Created by Sang Hyuk Cho on 1/17/17.
//  Copyright © 2017 sang. All rights reserved.
//

import Foundation
import RealmSwift

// Define model
class TodoItem: Object{
	dynamic var detail = ""
	dynamic var status = 0
}
