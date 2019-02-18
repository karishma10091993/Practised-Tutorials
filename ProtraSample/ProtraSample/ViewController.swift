//
//  ViewController.swift
//  ProtraSample
//
//  Created by kireeti on 18/02/19.
//  Copyright © 2019 KireetiSoftSolutions. All rights reserved.
// Carousel  Swift 4


import UIKit

class ViewController: UIViewController {

    var array = ["1","2","3","4","5","6","7","8","9","10"]
    @IBOutlet var collectionView: UICollectionView!
    var count  = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func forward(_ sender: Any) {
        if count >= 0 && count < array.count - 1{
        count += 1
            
        }
        self.collectionView.scrollToItem(at: NSIndexPath(item: count, section: 0) as IndexPath, at: UICollectionView.ScrollPosition.right, animated: true)
     
    }
    
    @IBAction func backward(_ sender: Any) {
        if count >= 0 {
            count -= 1
            
        }
        self.collectionView.scrollToItem(at: NSIndexPath(item: count, section: 0) as IndexPath, at: UICollectionView.ScrollPosition.left, animated: true)
    }
}

extension  ViewController : UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.nameCell.text = array[indexPath.row]
       
        return cell
    }
    
    
}
