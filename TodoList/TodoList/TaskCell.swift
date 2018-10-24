//
//  TaskCell.swift
//  TodoList
//
//  Created by SCMACEXT-04 on 10/22/18.
//  Copyright © 2018 Justin. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {
    
    @IBOutlet weak var icon: UIImageView!
    
    var checkBox: String? {
        didSet {
            if let checkBox = checkBox {
                icon.image = UIImage(named: checkBox)
                icon.contentMode = .scaleAspectFit
            }
        }
    }
}
