//
//  SecondViewController.swift
//  Task-3
//
//  Created by kireeti on 06/03/19.
//  Copyright © 2019 KireetiSoftSolutions. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UIGestureRecognizerDelegate{
    var str = String()
  //  var StrData = String()
    var VarStr = NSMutableArray()
    @IBOutlet var TableView: UITableView!
    @IBOutlet var nameLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
nameLbl.text = str
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        nameLbl.isUserInteractionEnabled = true
        nameLbl.addGestureRecognizer(tap)
       
    }
        // function which is triggered when handleTap is called
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        
//        print(str)
        for i in str{
            let strData = String(i)
            print(strData)
            VarStr.add(strData)
           
        }
        DispatchQueue.main.async {
            self.TableView.reloadData()
        }
       print(VarStr)
        }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SecondViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  self.VarStr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = self.VarStr[indexPath.row] as? String
        return cell
    }
    
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let index2 = str.index(str.startIndex, offsetBy: indexPath.row) //will call succ 2 times
        let lastChar: Character = str[index2]
        
        let lastStr = String(lastChar)
        let capStr = lastStr.uppercased()
        let char = Character(capStr)
        
        print("selected char : \(lastChar)")
        let chageStr = self.replace(myString: str, indexPath.row, char)
        self.nameLbl.text = chageStr
    }
    
    
    
    func replace(myString: String, _ index: Int, _ newChar: Character) -> String {
        var chars = Array(myString.characters)     // gets an array of characters
        chars[index] = newChar
        let modifiedString = String(chars)
        return modifiedString
    }
}



