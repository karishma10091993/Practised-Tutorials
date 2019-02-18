//
//  CustomCell.swift
//  iSecure
//
//  Created by Arun Kumar Reddy on 7/13/18.
//  Copyright © 2018 Arun Kumar Reddy. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
   
  
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    

    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var bankNameLabel: UILabel!
    @IBOutlet weak var AccNoLabel: UILabel!
    @IBOutlet weak var tableviewImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
