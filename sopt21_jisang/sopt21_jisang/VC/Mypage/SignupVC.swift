//
//  SignupVC.swift
//  sopt21_jisang
//
//  Created by leeyunkyung on 2018. 1. 3..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import UIKit

class SignupVC: UIViewController {
    @IBOutlet weak var btnUser: UIButton!
    @IBOutlet weak var btnMgr: UIButton!
    
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.white
        btnUser.setImage(#imageLiteral(resourceName: "user_3"), for: .normal)
        btnMgr.setImage(#imageLiteral(resourceName: "mgr_3"), for: .normal)
        
    }
    
    @IBAction func acUser(_ sender: Any) {
        btnUser.setImage(#imageLiteral(resourceName: "userclick_3"), for: .normal)
        btnMgr.setImage(#imageLiteral(resourceName: "mgr_3"), for: .normal)
    }
    
    @IBAction func acMgr(_ sender: Any) {
        btnUser.setImage(#imageLiteral(resourceName: "user_3"), for: .normal)
        btnMgr.setImage(#imageLiteral(resourceName: "mgrclick_3"), for: .normal)
    }
}

