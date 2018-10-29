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
    
    func test_removeTask() {
        let plaintext = tasks.getTodoItem(index: 0)
        
        tasks.removeTodoItem(index: 0)
        taskStatus.removeTaskStatus(index: 0)
        let tasksResult = tasks.getTodoItem(index: 0)
        
        XCTAssertNotEqual(plaintext, tasksResult)
    }
    
    func test_editTask() {
        let plaintext = tasks.getTodoItem(index: 0)
        
        tasks.setTodoItem(index: 0, newName: "Changed Name")
        let result = tasks.getTodoItem(index: 0)
        
        XCTAssertNotEqual(plaintext, result)
    }
    
    func test_completeTask() {
        taskStatus.completeTask(index: 0)
        let result = taskStatus.getTaskStatus(index: 0)
        
        XCTAssertTrue(result)
    }
    
    func test_savedData() {
        tasks.appendTodoItem(newTask: "New Task1")
        taskStatus.appendTaskStatus()
        tasks.appendTodoItem(newTask: "New Task2")
        taskStatus.appendTaskStatus()
        taskStatus.completeTask(index: 0)
        taskStatus.completeTask(index: 3)
        let beforeAppCloseTasks = tasks
        let beforeAppCloseStatus = taskStatus
        XCUIDevice.shared.press(XCUIDevice.Button.home)
        //Need to manually realunch the app at this point
        
        let taskResult = tasks
        let statusResult = taskStatus
        
        XCTAssertEqual(beforeAppCloseTasks,taskResult)
        XCTAssertEqual(beforeAppCloseStatus,statusResult)
    }
}
