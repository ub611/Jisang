//
//  StoreLocationPopoverVC.swift
//  sopt21_jisang
//
//  Created by leeyunkyung on 2018. 1. 7..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import UIKit

class StoreLocationPopoverVC: UIViewController {
    @IBOutlet weak var popBackground: UIImageView!
    @IBOutlet weak var tfPop: UITextView!
    var btnId = ""
    
    var flag = -1
    
    @IBAction func btnwriteAction(_ sender: Any) {
        if flag == -1 {
            popBackground.isHidden = false
            tfPop.isHidden = false
            
            flag = 1
        }
            
        else if flag == 1 {
            popBackground.isHidden = true
            tfPop.isHidden = true
            flag = -1
        }
        
        
    }
    @IBAction func btnDelete(_ sender: Any) {
        tfPop.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.white
        popBackground.isHidden = true
        tfPop.isHidden = true
        flag = -1
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

