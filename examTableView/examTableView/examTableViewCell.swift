//
//  examTableViewCell.swift
//  examTableView
//
//  Created by 402-24 on 02/12/2018.
//  Copyright © 2018 402-24. All rights reserved.
//

import UIKit

class examTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDetail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
