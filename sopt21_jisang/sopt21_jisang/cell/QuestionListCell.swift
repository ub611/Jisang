//
//  QuestionListCell.swift
//  sopt21_jisang
//
//  Created by ubin Kim on 2018. 1. 4..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import UIKit

class QuestionListCell: UITableViewCell {
    @IBOutlet weak var questionListDate: UILabel!
    @IBOutlet weak var questionListTitle: UILabel!
    @IBOutlet weak var questionListContent: UITextView!
    @IBOutlet weak var questionListImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
}

