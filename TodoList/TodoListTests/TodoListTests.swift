//
//  TodoListTests.swift
//  TodoListTests
//
//  Created by Justin on 10/17/18.
//  Copyright © 2018 Justin. All rights reserved.
//

import XCTest
@testable import TodoList

class TodoListTests: XCTestCase {
    
    var tasks = Tasks()
    var taskStatus = TaskStatus()
    
    func test_addTasks() {
        let plaintext = "New Task"
        let status = false
        
        tasks.appendTodoItem(newTask: "New Task")
        let result1 = tasks.getTodoItem(index:tasks.getCount()-1)
        taskStatus.appendTaskStatus()
        let result2 = taskStatus.getTaskStatus(index: tasks.getCount()-1)
        
        XCTAssertEqual(plaintext, result1)
        XCTAssertEqual(status, result2)
    }
}
