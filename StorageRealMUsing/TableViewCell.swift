//
//  TableViewCell.swift
//  StorageRealMUsing
//
//  Created by kireeti on 19/02/19.
//  Copyright © 2019 KireetiSoftSolutions. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var nameLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
