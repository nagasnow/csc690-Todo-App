//
//  TaskStatus.swift
//  TodoList
//
//  Created by SCMACEXT-18 on 10/29/18.
//  Copyright © 2018 Justin. All rights reserved.
//

import Foundation

struct TaskStatus {
    
    var taskStatus: [Bool] = [false,false,false]
    let defaults = UserDefaults.standard
    
    mutating func loadDefaults() {
        if(defaults.array(forKey: "completeKey") == nil) {
            self.defaults.set(self.taskStatus, forKey: "completeKey")
        } else {
            self.taskStatus = defaults.array(forKey:"completeKey") as! [Bool]
        }
    }
    
    mutating func setTaskStatusTrue(index: Int) {
        self.taskStatus[index] = true
        self.defaults.set(self.taskStatus, forKey:"completeKey")
    }
    
    mutating func removeTaskStatus(index: Int) {
        self.taskStatus.remove(at: index)
        self.defaults.set(self.taskStatus, forKey:"completeKey")
    }
    
    mutating func appendTaskStatus() {
        self.taskStatus.append(false)
        self.defaults.set(self.taskStatus, forKey:"completeKey")
    }
    
    func getTaskStatus(index: Int) -> Bool {
        return taskStatus[index]
    }
}
