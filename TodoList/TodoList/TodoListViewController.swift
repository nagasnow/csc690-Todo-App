//
//  TodoListViewController.swift
//  TodoList
//
//  Created by Justin on 10/17/18.
//  Copyright © 2018 Justin. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var tasks = Tasks()
    var taskStatus = TaskStatus()
    
    override func viewWillAppear(_ animation:Bool) {
        tasks.loadDefaults()
        taskStatus.loadDefaults()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.getCount()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todoItem = tasks.getTodoItem(index: indexPath.row)
        var completeTodoImage = UIImage(named:"noCheck")
        if(taskStatus.getTaskStatus(index: indexPath.row)) {
            completeTodoImage = UIImage(named:"check")
        }
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "tasksCell")! 
        cell.textLabel?.text = todoItem
        cell.imageView?.image = completeTodoImage
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let completeTitle = NSLocalizedString("Complete", comment: "Complete action")
        let completeAction = UITableViewRowAction(style: .normal, title: completeTitle) {
            (action, indexPath) in
            self.taskStatus.completeTask(index: indexPath.row)
            self.tableView.reloadData()
        }
        completeAction.backgroundColor = UIColor.green
        
        let editTitle = NSLocalizedString("Edit", comment: "Edit action")
        let editAction = UITableViewRowAction(style: .normal, title: editTitle) {(action, indexPath) in
            let alertController = UIAlertController(title: "Rename Task?", message: "", preferredStyle: .alert)
            let confirmAction = UIAlertAction(title: "OK", style: .default) { (_) in
                let taskName = alertController.textFields?[0].text
                self.tasks.setTodoItem(index:indexPath.row, newName:taskName!)
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
        editAction.backgroundColor = UIColor.blue
        
        let deleteTitle = NSLocalizedString("Delete", comment: "Delete action")
        let deleteAction = UITableViewRowAction(style: .destructive, title: deleteTitle) {
            (action, indexPath) in
            self.tasks.removeTodoItem(index: indexPath.row)
            self.taskStatus.removeTaskStatus(index: indexPath.row)
            self.tableView.reloadData()
        }
        
        return [deleteAction, editAction, completeAction]
    }
    
    @IBAction func addTaskButtonPressed(_ sender: Any) {
        let alertController = UIAlertController(title: "Name of task?", message: "", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "OK", style: .default) { (_) in
            let taskName = alertController.textFields?[0].text
            self.tasks.appendTodoItem(newTask: taskName!)
            self.taskStatus.appendTaskStatus()
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
