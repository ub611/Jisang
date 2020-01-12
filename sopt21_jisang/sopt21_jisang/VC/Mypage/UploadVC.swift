//
//  UploadVC.swift
//  sopt21_jisang
//
//  Created by leeyunkyung on 2018. 1. 11..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import UIKit

class UploadVC: UIViewController {
    @IBOutlet weak var outer: UIImageView!
    @IBOutlet weak var bottom: UIImageView!
    @IBOutlet weak var skirt: UIImageView!
    @IBOutlet weak var top: UIImageView!
    @IBOutlet weak var dress: UIImageView!
    @IBOutlet weak var bag: UIImageView!
    @IBOutlet weak var acc: UIImageView!
    @IBOutlet weak var shoes: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btn_outer(_ sender: Any) {
        outer.image = #imageLiteral(resourceName: "only_icon_outer")
        bottom.image = #imageLiteral(resourceName: "only_icon_bottom_non")
        skirt.image = #imageLiteral(resourceName: "only_icon_skirt_non")
        top.image = #imageLiteral(resourceName: "only_icon_top_non")
        dress.image = #imageLiteral(resourceName: "only_icon_dress_non")
        bag.image = #imageLiteral(resourceName: "only_icon_bag_non")
        acc.image = #imageLiteral(resourceName: "only_icon_acc_non")
        shoes.image = #imageLiteral(resourceName: "only_icon_shoes_non")
    }
    @IBAction func btn_top(_ sender: Any) {
        outer.image = #imageLiteral(resourceName: "only_icon_outer_non")
        bottom.image = #imageLiteral(resourceName: "only_icon_bottom_non")
        skirt.image = #imageLiteral(resourceName: "only_icon_skirt_non")
        top.image = #imageLiteral(resourceName: "only_icon_top")
        dress.image = #imageLiteral(resourceName: "only_icon_dress_non")
        bag.image = #imageLiteral(resourceName: "only_icon_bag_non")
        acc.image = #imageLiteral(resourceName: "only_icon_acc_non")
        shoes.image = #imageLiteral(resourceName: "only_icon_shoes_non")
    }
    @IBAction func btn_bottom(_ sender: Any) {
        outer.image = #imageLiteral(resourceName: "only_icon_outer_non")
        bottom.image = #imageLiteral(resourceName: "only_icon_bottom")
        skirt.image = #imageLiteral(resourceName: "only_icon_skirt_non")
        top.image = #imageLiteral(resourceName: "only_icon_top_non")
        dress.image = #imageLiteral(resourceName: "only_icon_dress_non")
        bag.image = #imageLiteral(resourceName: "only_icon_bag_non")
        acc.image = #imageLiteral(resourceName: "only_icon_acc_non")
        shoes.image = #imageLiteral(resourceName: "only_icon_shoes_non")
    }
    @IBAction func btn_skirt(_ sender: Any) {
        outer.image = #imageLiteral(resourceName: "only_icon_outer_non")
        bottom.image = #imageLiteral(resourceName: "only_icon_bottom_non")
        skirt.image = #imageLiteral(resourceName: "only_icon_skirt")
        top.image = #imageLiteral(resourceName: "only_icon_top_non")
        dress.image = #imageLiteral(resourceName: "only_icon_dress_non")
        bag.image = #imageLiteral(resourceName: "only_icon_bag_non")
        acc.image = #imageLiteral(resourceName: "only_icon_acc_non")
        shoes.image = #imageLiteral(resourceName: "only_icon_shoes_non")
    }
    @IBAction func btn_onepeice(_ sender: Any) {
        outer.image = #imageLiteral(resourceName: "only_icon_outer_non")
        bottom.image = #imageLiteral(resourceName: "only_icon_bottom_non")
        skirt.image = #imageLiteral(resourceName: "only_icon_skirt_non")
        top.image = #imageLiteral(resourceName: "only_icon_top_non")
        dress.image = #imageLiteral(resourceName: "only_icon_dress")
        bag.image = #imageLiteral(resourceName: "only_icon_bag_non")
        acc.image = #imageLiteral(resourceName: "only_icon_acc_non")
        shoes.image = #imageLiteral(resourceName: "only_icon_shoes_non")
    }
    
    @IBAction func btn_shoes(_ sender: Any) {
        outer.image = #imageLiteral(resourceName: "only_icon_outer_non")
        bottom.image = #imageLiteral(resourceName: "only_icon_bottom_non")
        skirt.image = #imageLiteral(resourceName: "only_icon_skirt_non")
        top.image = #imageLiteral(resourceName: "only_icon_top_non")
        dress.image = #imageLiteral(resourceName: "only_icon_dress_non")
        bag.image = #imageLiteral(resourceName: "only_icon_bag_non")
        acc.image = #imageLiteral(resourceName: "only_icon_acc_non")
        shoes.image = #imageLiteral(resourceName: "only_icon_shoes")
    }
    @IBAction func btn_bag(_ sender: Any) {
        outer.image = #imageLiteral(resourceName: "only_icon_outer_non")
        bottom.image = #imageLiteral(resourceName: "only_icon_bottom_non")
        skirt.image = #imageLiteral(resourceName: "only_icon_skirt_non")
        top.image = #imageLiteral(resourceName: "only_icon_top_non")
        dress.image = #imageLiteral(resourceName: "only_icon_dress_non")
        bag.image = #imageLiteral(resourceName: "only_icon_bag")
        acc.image = #imageLiteral(resourceName: "only_icon_acc_non")
        shoes.image = #imageLiteral(resourceName: "only_icon_shoes_non")
    }
    @IBAction func btn_acc(_ sender: Any) {
        outer.image = #imageLiteral(resourceName: "only_icon_outer_non")
        bottom.image = #imageLiteral(resourceName: "only_icon_bottom_non")
        skirt.image = #imageLiteral(resourceName: "only_icon_skirt_non")
        top.image = #imageLiteral(resourceName: "only_icon_top_non")
        dress.image = #imageLiteral(resourceName: "only_icon_dress_non")
        bag.image = #imageLiteral(resourceName: "only_icon_bag_non")
        acc.image = #imageLiteral(resourceName: "only_icon_acc")
        shoes.image = #imageLiteral(resourceName: "only_icon_shoes_non")
    }
    
}

