//
//  TodoListViewController.swift
//  TodoList
//
//  Created by Justin on 10/17/18.
//  Copyright © 2018 Justin. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var todoItems: [String] = ["Brush Teeth", "Do Homework", "Make Dinner"]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todoItem = todoItems[indexPath.row]
        
        let cell = UITableViewCell()
        cell.textLabel?.text = todoItem
        return cell
    }
    
    @IBAction func addTaskButtonPressed(_ sender: Any) {
        let alertController = UIAlertController(title: "Name of task?", message: "", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "OK", style: .default) { (_) in
            let taskName = alertController.textFields?[0].text
            self.todoItems.append(taskName!)
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter Task Name"
        }
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }

}
