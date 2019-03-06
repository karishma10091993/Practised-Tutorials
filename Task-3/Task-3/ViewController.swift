//
//  ViewController.swift
//  Task-3
//
//  Created by kireeti on 06/03/19.
//  Copyright © 2019 KireetiSoftSolutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
        var name = SecondViewController()
    @IBOutlet var tableView: UITableView!
    var nameArr = NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        nameArr = ["Karishma","Prasad","Raghu","Hrithik","Sai Lakshmi"]

        var s = "overpopulat"
        for i in s{
            print(i)
           
        }
        
        }
    
    
    }
    


extension ViewController: UITableViewDelegate,UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel!.text = nameArr[indexPath.row] as? String
        return cell
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        secondVC.str = nameArr[indexPath.row] as! String

        self.navigationController?.pushViewController(secondVC, animated: true)
       
    }
}




