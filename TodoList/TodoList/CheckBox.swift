//
//  CheckBox.swift
//  TodoList
//
//  Created by SCMACEXT-04 on 10/22/18.
//  Copyright © 2018 Justin. All rights reserved.
//

import UIKit

class CheckBox: UIButton {
    convenience init() {
        self.init(frame: .zero)
        self.setImage(UIImage(named: "noCheck"), for: .normal)
        self.setImage(UIImage(named: "check"), for:.selected)
        self.addTarget(TodoListViewController,action selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc private func buttonTapped() {
        self.isSelected = !self.isSelected
    }
}
