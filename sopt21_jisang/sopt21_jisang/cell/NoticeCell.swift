//
//  NoticeCell.swift
//  sopt21_jisang
//
//  Created by ubin Kim on 2018. 1. 3..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import UIKit

class NoticeCell: UITableViewCell {
    
    @IBOutlet weak var noticeDate: UILabel!
    @IBOutlet weak var noticeTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

