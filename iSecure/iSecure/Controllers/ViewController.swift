//
//  ViewController.swift
//  iSecure
//
//  Created by Arun Kumar Reddy on 7/13/18.
//  Copyright © 2018 Arun Kumar Reddy. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource {
   
    
    var currentItemIndexPath = 0
    var collectionLablesArray = ["Cards","Banks","Social","Personal","Others"]
    var collectionLablesArray1 = ["Card1","card2","card3","card4","card5"]
    var collectionLablesArray2=["bank name1","bank name2","bank name3","bank name4","bank name5"]
    var tableviewBankACNO=["account number1","account number2","account number3","account number4","account number5"]
    var tableviewSocialImages=[#imageLiteral(resourceName: "facebook"),#imageLiteral(resourceName: "twitter"),#imageLiteral(resourceName: "instagram-new"),#imageLiteral(resourceName: "gmail-login")]
    var tableviewSocialUseridLabel=["userid1","userid2","userid3","userid4"]
    var tableViewSocPassWordLabel = ["PassWord1","PassWord2","password3","password4"]
    var collectionImagesArrays = [#imageLiteral(resourceName: "bank-cards"),#imageLiteral(resourceName: "museum"),#imageLiteral(resourceName: "globe"),#imageLiteral(resourceName: "user-group-woman-woman-1"),#imageLiteral(resourceName: "user-credentials")]
    var cardImagesArray=[#imageLiteral(resourceName: "bank-cards"),#imageLiteral(resourceName: "bank-cards"),#imageLiteral(resourceName: "bank-cards"),#imageLiteral(resourceName: "bank-cards"),#imageLiteral(resourceName: "bank-cards")]
    var bankImageArray=[#imageLiteral(resourceName: "museum"),#imageLiteral(resourceName: "museum"),#imageLiteral(resourceName: "museum"),#imageLiteral(resourceName: "museum"),#imageLiteral(resourceName: "museum")]
    var personalImageArray=[#imageLiteral(resourceName: "personal"),#imageLiteral(resourceName: "personal"),#imageLiteral(resourceName: "personal"),#imageLiteral(resourceName: "personal"),#imageLiteral(resourceName: "personal")]
    var tableviewOthersLabel=["other1","other2","other3","other4","other5",]
    var pickerValues=["Creditcard","Debitcard"]
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let CustomoCell = UINib(nibName: "CustomCell", bundle: nil)
        self.tableView.register(CustomoCell, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
        collectionView.showsHorizontalScrollIndicator=false
        tableView.showsVerticalScrollIndicator=false
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if currentItemIndexPath == 0
        {
        return collectionLablesArray1.count
            
        }else if currentItemIndexPath == 1
        {
            return collectionLablesArray.count
        }else if currentItemIndexPath == 2
        {
            return tableviewSocialImages.count
        }
        else if currentItemIndexPath == 3{
           return 5
        }
        else {
            return 5
        }
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       if currentItemIndexPath == 0
       {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as!CustomCell
        cell.tableviewImageView.image = cardImagesArray[indexPath.row]
        cell.bankNameLabel.text = collectionLablesArray1[indexPath.row]
        cell.AccNoLabel.text=collectionLablesArray2[indexPath.row]
   


       
       
        return cell
       }else if currentItemIndexPath==1
       {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as!CustomCell
        cell.tableviewImageView.image = bankImageArray[indexPath.row]
        cell.bankNameLabel.text = collectionLablesArray2[indexPath.row]
         cell.AccNoLabel.text=tableviewBankACNO[indexPath.row]
        return cell
       }else if currentItemIndexPath==2
       {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as!CustomCell
        cell.tableviewImageView.image = tableviewSocialImages[indexPath.row]
        cell.bankNameLabel.text = tableViewSocPassWordLabel[indexPath.row]
        cell.AccNoLabel.text=tableviewSocialUseridLabel[indexPath.row]
        return cell
        
       }else if currentItemIndexPath==3{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as!CustomCell
        cell.tableviewImageView.image=personalImageArray[indexPath.row]
        cell.backgroundColor=UIColor.lightGray
        return cell
        }
       else {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as!CustomCell
        cell.backgroundColor=UIColor.lightGray
        //cell.tableviewImageView.image = tableviewSocialImages[indexPath.row]
        //cell.bankNameLabel.text = ""
        cell.AccNoLabel.text=tableviewOthersLabel[indexPath.row]
        return cell
        }
       
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionLablesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)as!CollectionViewCell
        cell.imageCollection.image = collectionImagesArrays[indexPath.row]
        cell.collectionViewLable.text = collectionLablesArray[indexPath.row]
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
       currentItemIndexPath = indexPath.item
        tableView.reloadData()
}
    
    
    
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return 2
//    }
}
