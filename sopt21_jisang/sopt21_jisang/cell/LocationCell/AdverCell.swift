//
//  AdverCell.swift
//  sopt21_jisang
//
//  Created by ubin Kim on 2018. 1. 10..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import UIKit

class AdverCell: UITableViewCell {
    @IBOutlet weak var locLabel: UILabel!
    @IBOutlet weak var locScrollView: UIScrollView!
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
