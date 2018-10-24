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
    var completeTodoImages: [Data] = [UIImagePNGRepresentation(UIImage(named: "noCheck")!)!, UIImagePNGRepresentation(UIImage(named: "noCheck")!)!, UIImagePNGRepresentation(UIImage(named: "noCheck")!)!]
    let defaults = UserDefaults.standard
    
    override func viewWillAppear(_ animation:Bool) {
        if(defaults.array(forKey: "todoNamesKey") == nil || defaults.array(forKey: "completeKey") == nil) {
            self.defaults.set(self.todoItems,forKey: "todoNamesKey")
            self.defaults.set(self.completeTodoImages, forKey: "completeKey")
        } else {
            todoItems = defaults.array(forKey: "todoNamesKey") as! [String]
            completeTodoImages = defaults.array(forKey:"completeKey") as! [Data]
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todoItem = todoItems[indexPath.row]
        let completeTodoImage = UIImage(data: completeTodoImages[indexPath.row])
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "tasksCell") as! UITableViewCell
        cell.textLabel?.text = todoItem
        cell.imageView?.image = completeTodoImage
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let completeTitle = NSLocalizedString("Complete", comment: "Complete action")
        let completeAction = UITableViewRowAction(style: .normal, title: completeTitle) {
            (action, indexPath) in
            self.completeTodoImages[indexPath.row] = UIImagePNGRepresentation(UIImage(named: "check")!)!
            self.tableView.reloadData()
            self.defaults.set(self.completeTodoImages, forKey:"completeKey")
        }
        completeAction.backgroundColor = UIColor.green
        
        let editTitle = NSLocalizedString("Edit", comment: "Edit action")
        let editAction = UITableViewRowAction(style: .normal, title: editTitle) {(action, indexPath) in
            let alertController = UIAlertController(title: "Rename Task?", message: "", preferredStyle: .alert)
            let confirmAction = UIAlertAction(title: "OK", style: .default) { (_) in
                let taskName = alertController.textFields?[0].text
                self.todoItems[indexPath.row] = taskName!
                self.tableView.reloadData()
                self.defaults.set(self.todoItems,forKey: "todoNamesKey")
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
            (action, indexPath) in self.todoItems.remove(at: indexPath.row)
            self.completeTodoImages.remove(at:indexPath.row)
            self.tableView.reloadData()
            self.defaults.set(self.todoItems, forKey: "todoNamesKey")
            self.defaults.set(self.completeTodoImages, forKey:"completeKey")
        }
        
        return [deleteAction, editAction, completeAction]
    }
    
    @IBAction func addTaskButtonPressed(_ sender: Any) {
        let alertController = UIAlertController(title: "Name of task?", message: "", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "OK", style: .default) { (_) in
            let taskName = alertController.textFields?[0].text
            self.todoItems.append(taskName!)
            self.completeTodoImages.append(UIImagePNGRepresentation(UIImage(named: "noCheck")!)!)
            self.tableView.reloadData()
            self.defaults.set(self.todoItems,forKey: "todoNamesKey")
            self.defaults.set(self.completeTodoImages, forKey:"completeKey")
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
