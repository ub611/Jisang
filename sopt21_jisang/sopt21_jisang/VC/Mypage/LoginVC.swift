//
//  LoginVC.swift
//  sopt21_jisang
//
//  Created by leeyunkyung on 2018. 1. 3..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import UIKit

class LoginVC: UIViewController,NetworkCallback {
    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var pwd: UITextField!
    let data = UserDefaults.standard
    
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func btn_facebook(_ sender: Any) {
        simpleAlert(title: "알람", msg: "서비스 준비중입니다.")
    }
    @IBAction func btn_naver(_ sender: Any) {
        simpleAlert(title: "알람", msg: "서비스 준비중입니다.")
    }
    
    @IBAction func btn_login(_ sender: Any) {
        let id1 = gsno(id.text)
        let pwd2 = gsno(pwd.text)
        let model = userModel(self)
        
        if id1.isEmpty{
            simpleAlert(title: "ID", msg: "아이디를 입력해주세요.")
        }
        else if pwd2.isEmpty{
            simpleAlert(title: "PASSWORD", msg: "비밀번호를 입력해주세요.")
        }
        else if checkInput(input: pwd2) {
            simpleAlert(title: "%, \\, /, ?, &, =", msg: "비밀번호란에 적합하지 않은 문자를 사용했습니다.")
            
            //%, \, /, ?, &
        }
        else if checkInput(input: id1) {
            simpleAlert(title: "%, \\, /, ?, &, =", msg: "아이디란에 적합하지 않은 문자를 사용했습니다.")
            
        }
            
        else {
            model.userLogin(id: id1, pwd: pwd2)
            
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    func networkResult(resultData: Any, code: String) {
        if code == "loginSuccess"{
            guard
                resultData is loginMsgVO
            else {
                return
            }
            self.dismiss(animated: true, completion: nil)
            
        }else if code == "loginError"{
            simpleAlert(title: "LOGIN ERROR", msg: "아이디와 비밀번호를 확인해주세요.")
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.white
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
}

