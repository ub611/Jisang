//
//  LocBtnCell.swift
//  sopt21_jisang
//
//  Created by ubin Kim on 2018. 1. 11..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import UIKit

class LocBtnCell: UITableViewCell {
     var obj : (() -> Void)? = nil

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func btnDetail(_ sender: Any) {
        print("cell1")
        
    }
    @IBAction func btnQuestion(_ sender: Any) {
        print("cell2")
        
    }
    
}
