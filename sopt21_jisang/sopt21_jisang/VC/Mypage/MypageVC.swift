//
//  MypageVC.swift
//  sopt21_jisang
//
//  Created by leeyunkyung on 2018. 1. 1..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import UIKit

class MypageVC: UIViewController {
    
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var line: UIView!
    @IBOutlet weak var mgrLabel: UILabel!
    @IBOutlet weak var mgrBtn: UIButton!
    let data = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*loginLabel.text = "로그인"
        line.isHidden = true
        mgrLabel.isHidden = true
        mgrBtn.isHidden = true*/
        
        navigationController?.navigationBar.barTintColor = UIColor.white
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
        
        let admin = data.integer(forKey: "admin")
        print("admin " + admin.description)
        
        /*if(admin == 1){//일반일때
            loginLabel.text = "로그아웃"
            print("a")
        }
        else if(admin == 2){//관리자일때
            loginLabel.text = "로그아웃"
            line.isHidden = false
            mgrLabel.isHidden = false
            mgrBtn.isHidden = false
            print("b")
        }
        else{//비회원일때
            loginLabel.text = "로그인"
            line.isHidden = true
            mgrLabel.isHidden = true
            mgrBtn.isHidden = true
            print("c")
        }*/
        
        
        
        
    }
    
}

