//
//  CreateTaskVC.swift
//  CoreDataToDoList
//
//  Created by David Boles on 5/23/17.
//  Copyright © 2017 David Boles. All rights reserved.
//

import UIKit

class CreateTaskVC: UIViewController {

    
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    var previousVC = MainVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }

    //well
    
    @IBAction func addTapped(_ sender: Any) {
        let task = Task()
        task.name = taskNameTextField.text!
        task.important = importantSwitch.isOn
        
        previousVC.tasks.append(task)
        previousVC.tableView.reloadData()
        
        navigationController?.popViewController(animated: true)
        
    }
   

    
    
}
