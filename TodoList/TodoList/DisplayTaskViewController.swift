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
    var mainViewController:TodoListViewController?
    
    var cellNumber = 0
    var receivedString = ""
    var receivedNum = 0
    
    override func viewWillAppear(_ animation:Bool) {
        super.viewWillAppear(animation)
        taskName.text = receivedString
        cellNumber = receivedNum
    }
    
    @IBAction func EditButtonPressed(_ sender: Any) {
        let alertController = UIAlertController(title: "Change Title?", message: "", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Confirm", style: .default) { (_) in
            let newTaskName = alertController.textFields?[0].text
            self.taskName.text = newTaskName
            self.mainViewController?.onUserAction(stringData: newTaskName!, numData: self.cellNumber)
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
