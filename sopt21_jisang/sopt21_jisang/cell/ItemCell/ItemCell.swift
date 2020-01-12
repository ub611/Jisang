//
//  ItemCell.swift
//  sopt21_jisang
//
//  Created by ubin Kim on 2018. 1. 1..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import UIKit

class ItemCell: UICollectionViewCell {
    @IBOutlet weak var itemImgView: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
