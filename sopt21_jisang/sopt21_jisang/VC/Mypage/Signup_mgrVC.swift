//
//  Signup_mgrVC.swift
//  sopt21_jisang
//
//  Created by leeyunkyung on 2018. 1. 3..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import UIKit

class Signup_mgrVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate,UIGestureRecognizerDelegate, NetworkCallback {
    
    @IBOutlet weak var storeLocation: UITextField!
    @IBOutlet weak var ruleCheck: UIButton!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPwd2: UITextField!
    @IBOutlet weak var tfPwd: UITextField!
    @IBOutlet weak var tfShopName: UITextField!
    @IBOutlet weak var tfMgrName: UITextField!
    @IBOutlet weak var tfMgrTell: UITextField!
    @IBOutlet weak var tfAddr: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    let pickerAddr  = ""
    
    var flag = -1
    
    //Lift Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.white
        ruleCheck.setImage(#imageLiteral(resourceName: "check"), for: .normal)
        initPickerView()
        scrollView.keyboardDismissMode = .onDrag

    }
    
    //touchAction
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
    
    //signIn
    
    @IBAction func btnSignIn(_ sender: Any) {
        let email = gsno(tfEmail.text)
        let pwd = gsno(tfPwd.text)
        let pwd2 = gsno(tfPwd2.text)
        
        let shopName = gsno(tfShopName.text)
        let shopAddr1 = gsno(storeLocation.text)
        let shopAddr2 = gsno(tfAddr.text)
        
        let name = gsno(tfMgrName.text)
        let tell = gsno(tfMgrTell.text)
        
        let model = userModel(self)
        
        //제약
        
        if email.isEmpty || pwd.isEmpty || pwd2.isEmpty || shopName.isEmpty || shopAddr1.isEmpty || shopAddr2.isEmpty || name.isEmpty || tell.isEmpty {
            simpleAlert(title: "알림", msg: "필드를 모두 채워주세요.")
        }
            
        else if flag == -1 {
            simpleAlert(title: "알림", msg: "이용약관에 동의해주세요")
        }
            
        else if checkInput(input: email) || checkInput(input: pwd) || checkInput(input: pwd2) || checkInput(input: shopName) || checkInput(input: shopAddr2) || checkInput(input: shopAddr1) || checkInput(input: name) || checkInput(input: tell) {
            simpleAlert(title: "%, \\, /, ?, &, =", msg: "적합하지 않은 문자를 사용했습니다.")
        }
        else if shopAddr2.contains(" ") || !shopAddr2.contains("-"){
            simpleAlert(title: "매장주소 오류", msg: "공백을 제외하고,\n '-'를 사용해 매장주소를 입력해주세요.")
        }
            
        else if !email.contains("@") || !email.contains(".") {
            simpleAlert(title:"알림" , msg: "올바른 이메일을 적어주세요.")
        }
            
        else if pwd.count < 6 {
            simpleAlert(title: "알림", msg: "비밀번호는 6자 이상으로 설정해주세요.")
        }
        else if pwd != pwd2 {
            simpleAlert(title: "알림", msg: "비밀번호가 일치하지 않습니다.")
        }
        else {
            model.mgrSignUp(id: email, pwd: pwd, name: name, pnumber: tell, mname: shopName, mlocation: shopAddr1, maddress: shopAddr2)
        }
        
    }
    
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
    
    
    
    //pickerView
    var location_picker = UIPickerView()
    var location_Toolbar = UIToolbar()
    var big_category_index : Int?
    var location : [String] = ["강남", "고속터미널", "잠실", "영등포", "부평"]
    
    
    func initToolbar(){
        
        let barFrame = CGRect(x: 0, y: 0, width: view.frame.width, height: 40)
        let btnSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        
        
        let locationToolbar_btnDone = UIBarButtonItem(title: "지역 선택", style: .done, target: self, action: #selector(selectedLocation))
        location_Toolbar = UIToolbar(frame: barFrame)
        location_Toolbar.setItems([btnSpace,locationToolbar_btnDone], animated: true)
        
        
    }
    
    func initPickerView(){
        initToolbar()
        
        location_picker.delegate = self
        location_picker.dataSource = self
        storeLocation.inputView = location_picker
        storeLocation.inputAccessoryView = location_Toolbar
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == location_picker {
            return location.count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView == location_picker){
            return location[row]
        }
        return ""
    }
    
    @objc func selectedLocation(){
        let row = location_picker.selectedRow(inComponent: 0)
        print("selectLocation")
        print(row)
        self.storeLocation.text! = self.location[row]
        print(storeLocation.text!)
        big_category_index = row
        storeLocation.endEditing(true)
        storeLocation.isEnabled = true
    }
}

