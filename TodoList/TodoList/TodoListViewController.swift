//
//  TodoListViewController.swift
//  TodoList
//
//  Created by Justin on 10/17/18.
//  Copyright © 2018 Justin. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var todoItems: [String] = ["Brush Teeth", "Do CSC690 Assignment 2", "Make Dinner"]
    var selectedRow: Int = 0
    var receivedString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todoItems[selectedRow] = receivedString
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todoItem = todoItems[indexPath.row]
        
        let cell = UITableViewCell()
        cell.textLabel?.text = todoItem
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(todoItems[indexPath.row])
        selectedRow = indexPath.row
        performSegue(withIdentifier: "taskTransition", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondViewController = segue.destination as? DisplayTaskViewController
        secondViewController?.receivedString = todoItems[selectedRow]
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
