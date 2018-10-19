//
//  DisplayTaskViewController.swift
//  TodoList
//
//  Created by RCMACEXT-46 on 10/18/18.
//  Copyright © 2018 Justin. All rights reserved.
//

import UIKit

class DisplayTaskViewController: UIViewController {
    
    @IBOutlet weak var taskName: UILabel!
    
    var receivedString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskName.text = receivedString
    }
    
    @IBAction func EditButtonPressed(_ sender: Any) {
        let alertController = UIAlertController(title: "Change Title?", message: "", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Confirm", style: .default) { (_) in
            let newTaskName = alertController.textFields?[0].text
            self.taskName.text = newTaskName
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter Task Name"
        }
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let firstViewController = segue.destination as? TodoListViewController
        firstViewController?.receivedString = self.taskName.text!
    }
}
