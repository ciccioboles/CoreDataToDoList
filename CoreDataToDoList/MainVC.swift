//
//  MainVC.swift
//  CoreDataToDoList
//
//  Created by David Boles on 5/22/17.
//  Copyright © 2017 David Boles. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var tasks : [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tasks = makeTasks()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
    
    
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let theCell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important {
            theCell.textLabel?.text = "❗️\(task.name)"
        }else {
           theCell.textLabel?.text = task.name
        }
        
        return theCell
    }
    
    func makeTasks() -> [Task] {
        let task1 = Task()
        task1.name = "Walk the dogs"
        task1.important = false
        
        let task2 = Task()
        task2.name = "Walk the cats"
        task2.important = true
        
        let task3 = Task()
        task3.name = "Walk the birds"
        task3.important = false
        
        
        return [task1, task2, task3]
        
    }
    
    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! CreateTaskVC
        nextVC.previousVC = self
        
    }
    
    override func viewDidLayoutSubviews() {
        if let rect = self.navigationController?.navigationBar.frame {
            let y = rect.size.height + rect.origin.y
            self.tableView.contentInset = UIEdgeInsetsMake( y, 0, 0, 0)
        }
    }

    

}

