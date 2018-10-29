//
//  Tasks.swift
//  TodoList
//
//  Created by SCMACEXT-18 on 10/29/18.
//  Copyright © 2018 Justin. All rights reserved.
//

import Foundation

struct Tasks {
    
    var todoItems: [String] = ["Brush Teeth", "Do CSC690 Assignment 2", "Make Dinner"]
    let defaults = UserDefaults.standard
    
    mutating func loadDefaults() {
        if(defaults.array(forKey: "todoNamesKey") == nil) {
            self.defaults.set(self.todoItems,forKey: "todoNamesKey")
        } else {
            self.todoItems = defaults.array(forKey: "todoNamesKey") as! [String]
        }
    }
    
    mutating func appendTodoItem(newTask: String){
        self.todoItems.append(newTask)
        self.defaults.set(self.todoItems,forKey: "todoNamesKey")
    }
    
    mutating func setTodoItem(index: Int, newName: String) {
        self.todoItems[index] = newName
        self.defaults.set(self.todoItems,forKey: "todoNamesKey")
    }
    
    mutating func removeTodoItem(index: Int) {
        self.todoItems.remove(at: index)
        self.defaults.set(self.todoItems,forKey: "todoNamesKey")
    }
    
    func getTodoItem(index: Int) -> String {
        return self.todoItems[index]
    }
    
    func getCount() -> Int {
        return self.todoItems.count
    }
}
