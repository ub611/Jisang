//
//  Signup_userVC.swift
//  sopt21_jisang
//
//  Created by leeyunkyung on 2018. 1. 3..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import UIKit

class Signup_userVC: UIViewController, NetworkCallback {
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfTell: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPwd: UITextField!
    @IBOutlet weak var tfPwd2: UITextField!
    @IBOutlet weak var ruleCheck: UIButton!
    
    var flag = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.white
        ruleCheck.setImage(#imageLiteral(resourceName: "check"), for: .normal)
        flag = -1
        
    }
    
    //lifeCycle
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    
    
    //func
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func acRuleCheck(_ sender: Any) {
        if(flag == -1){
            ruleCheck.setImage(#imageLiteral(resourceName: "chchch"), for: .normal)
            flag = 1
        }
        else {
            ruleCheck.setImage(#imageLiteral(resourceName: "check"), for: .normal)
            flag = -1;
        }
    }
    
    @IBAction func btnSignIn(_ sender: Any) {
        let name = gsno(tfName.text)
        let tell = gsno(tfTell.text)
        let email =  gsno(tfEmail.text)
        let pwd =  gsno(tfPwd.text)
        
        let model = userModel(self)
        
        if name.isEmpty || tell.isEmpty || email.isEmpty || pwd.isEmpty || gsno(tfPwd2.text).isEmpty {
            simpleAlert(title: "알림", msg: "입력칸을 모두 채워주세요.")
        }
        else if gsno(tfPwd.text) != gsno(tfPwd2.text) {
            simpleAlert(title: "알림", msg: "비밀번호가 일치하지 않습니다.")
        }
            
            //ascii제약
        else if checkInput(input: name){
            simpleAlert(title: "%, \\, /, ?, &, =", msg: "이름란에 적합하지 않은 문자를 사용했습니다.")
        }
        else if checkInput(input: tell){
            simpleAlert(title: "%, \\, /, ?, &, =", msg: "전화번호란에 적합하지 않은 문자를 사용했습니다.")
            
        }
        else if checkInput(input: email){
            simpleAlert(title: "%, \\, /, ?, &, =", msg: "이메일란에 적합하지 않은 문자를 사용했습니다.")
            
        }
        else if checkInput(input: pwd) {
            simpleAlert(title: "%, \\, /, ?, &, =", msg: "비밀번호란에 적합하지 않은 문자를 사용했습니다.")
            
        }
            //이용약관
        else if flag != 1{
            simpleAlert(title: "알림", msg: "이용약관에 동의해주세요")
        }
            
            //제약
        else if !email.contains("@") || !email.contains(".") {
            simpleAlert(title:"알림" , msg: "올바른 이메일을 적어주세요.")
            
        }
        else if pwd.count < 6 {
            simpleAlert(title: "알림", msg: "비밀번호는 6자 이상으로 설정해주세요")
            
        }
            
        else {
            model.userSignUp(id: email, pwd: pwd, name: name, pnumber: pwd)
        }
        
    }
    //network
    
    func networkResult(resultData: Any, code: String) {
        if code == "joinSuccess"{
            let alert = UIAlertController(title : "완료", message: "회원가입이 완료되었습니다.", preferredStyle : .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in
                self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)            } ))
            
            self.present(alert, animated: true, completion: nil)
            
            
        }else if code == "idDuplicated"{
            simpleAlert(title: "알림", msg: "이미 존재하는 이메일입니다.")
        }
    }
}

