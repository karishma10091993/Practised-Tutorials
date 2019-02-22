//
//  ViewController.swift
//  TableviewRowSelection
//
//  Created by kireeti on 22/02/19.
//  Copyright © 2019 KireetiSoftSolutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var selectedArray = NSMutableArray()
    var arrayData = NSMutableArray()
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        arrayData = ["Hello 1","Hello 2","Hello 3","Hello 4","Hello 5","Hello 6","Hello 7","Hello 8","Hello 9","Hello 10","Hello 11","Hello 12","Hello 13","Hello 14","Hello 15","Hello 16","Hello 17","Hello 18","Hello 19","Hello 20","Hello 21","Hello 22","Hello 23","Hello 24","Hello 25","Hello 26","Hello 27","Hello 28","Hello 29","Hello 30"]
        self.tableView.isEditing = true
        self.tableView.allowsMultipleSelectionDuringEditing = true
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    @IBAction func nextBtn(_ sender: Any) {
        print(self.selectedArray)
    }
    
  
    @IBAction func multipleBtnSelection(_ sender: UIButton) {
        self.selectedArray.removeAllObjects()
        if sender.isSelected{
            for row in 0..<arrayData.count{
                self.tableView.selectRow(at: IndexPath.init(row: row, section: 0), animated: false, scrollPosition: .none)
            }
            sender.setImage(UIImage.init(named: "select.png"), for: .normal)
            sender.isSelected = false
            self.selectedArray.add(arrayData)
        }else{
            for row in 0..<arrayData.count{
                self.tableView.deselectRow(at: IndexPath.init(row: row, section: 0), animated: false)
            }
             sender.isSelected = true
            sender.setImage(UIImage.init(named:"deselect.png"), for: .normal)
           
             self.selectedArray.removeAllObjects()
        }
    }
}


extension ViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = arrayData[indexPath.row] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        deselectselectedCell(tableview: tableView, indexPath: indexPath)
       // print("select")
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        deselectselectedCell(tableview: tableView, indexPath: indexPath)
         //print("Deselect")
    }
    
}

extension ViewController {
    func deselectselectedCell(tableview : UITableView, indexPath : IndexPath){
        self.selectedArray.removeAllObjects()
        if let arr = tableview.indexPathsForSelectedRows{
        for index in  arr{
            self.selectedArray.add(arrayData[index.row])
        }
        }
        print(selectedArray)
    }
}
