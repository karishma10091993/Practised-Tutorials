//
//  ViewController.swift
//  StorageRealMUsing
//
//  Created by kireeti on 19/02/19.
//  Copyright © 2019 KireetiSoftSolutions. All rights reserved.
//

import UIKit
import CoreData
import RealmSwift
import Realm
class ViewController: UIViewController {

    @IBOutlet var toDoTableView: UITableView!
    var tfStr = String()
    var arr = NSMutableArray()
    var items = [Items]()
    var realm: Realm!
    var ToDoList: Results<ToDoListItem> {
        
        get {
            return realm.objects(ToDoListItem.self)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
      realm = try! Realm()


    }


    @IBAction func addBtn(_ sender: Any) {
//        displayAlertToAddTaskList()
//
//        self.toDoTableView.reloadData()
        btnPressed()
    }
   
    
    func btnPressed(){
        let alertVC = UIAlertController(title: "New ToDo", message: "What do you want to do?", preferredStyle: .alert)
        
        alertVC.addTextField { (UITextField) in
        }
        
        let cancelAction = UIAlertAction.init(title: "Cancel", style: .destructive, handler: nil)
       alertVC.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "Add", style: .default) { (UIAlertAction)  -> Void in
        let todoItemTextField = (alertVC.textFields?.first)! as UITextField
        let newToDoListItem = ToDoListItem()       // (8)
        newToDoListItem.name = todoItemTextField.text!
        newToDoListItem.done = false
        try! self.realm.write({
        self.realm.add(newToDoListItem)    // (9)
        self.toDoTableView.insertRows(at: [IndexPath.init(row: self.ToDoList.count-1, section: 0)], with: .automatic)
         })
         }
        alertVC.addAction(addAction)
       self.present(alertVC, animated: true, completion: nil)
    }


    func displayAlertToAddTaskList(){
        //1. Create the alert controller.
        let alert = UIAlertController(title: "Some Title", message: "Enter a text", preferredStyle: .alert)

        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.placeholder = "Some default text"
        }

        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert!.textFields![0] // Force unwrapping because we know it exists.
            print("Text field: \(String(describing: textField.text))")
            self.tfStr = textField.text!
            self.arr.add(self.tfStr)

        }))
       alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)

}
}

extension ViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      //  return  self.arr.count
        return ToDoList.count
     }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = toDoTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let item = ToDoList[indexPath.row]
        cell.nameLbl.text = item.name
        cell.accessoryType = item.done == true ? .checkmark : .none
        
        return cell
      }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let item = ToDoList[indexPath.row] //1
        
        try! self.realm.write({
            item.done = !item.done
        })                                  //2
        
        tableView.reloadRows(at: [indexPath], with: .automatic) //3
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if (editingStyle == .delete){
            let item = ToDoList[indexPath.row]
            
            try! self.realm.write({
                self.realm.delete(item)
            })
            
            tableView.deleteRows(at:[indexPath], with: .automatic)
        }
    }
}
