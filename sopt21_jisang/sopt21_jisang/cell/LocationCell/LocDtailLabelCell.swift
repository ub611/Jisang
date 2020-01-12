//
//  LocDtailLabelCell.swift
//  sopt21_jisang
//
//  Created by ubin Kim on 2018. 1. 11..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import UIKit

class LocDtailLabelCell: UITableViewCell {
    @IBOutlet weak var itemName: UILabel!
    
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var itemDetail: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
