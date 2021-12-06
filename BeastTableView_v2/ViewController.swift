//
//  ViewController.swift
//  BeastTableView_v2
//
//  Created by Hajar Alomari on 06/12/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var addTextField: UITextField!
    
    // Create this array at the top of your class as a property
    var tasks = ["Exercise for 30 minutes", "Wireframe for some project", "Do laundry"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
    }
    

    @IBAction func addButtonPressed(_ sender: UIButton) {
        let userTask = addTextField.text
        if userTask != nil && userTask != "" {
            tasks.append(userTask!)
            tableView.reloadData()
        } else{
            addTextField.placeholder = "Please type something"
        }
       
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = tasks[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = task
        
        return cell
    }
    
    
}

