//
//  userModel.swift
//  sopt21_jisang
//
//  Created by leeyunkyung on 2018. 1. 4..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import Alamofire
import ObjectMapper
import Kingfisher
import SwiftyJSON
import AlamofireObjectMapper

class userModel : NetworkModel{
    
    func userLogin(id:String,pwd:String){
        let URL = "\(baseURL)/signin"
        
        let body : [String:String] = [
            "id" : id,
            "pwd" : pwd
        ]
        
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: nil).responseObject{
            (response : DataResponse<msgVO>) in
            switch response.result{
            case .success:
                guard let Message = response.result.value else{
                    self.view.networkFailed()
                    return
                }
                
                if Message.msg == "login success"{
                    let ud = UserDefaults.standard
                    ud.set((Message.data?.token!)!, forKey: "token")
                    //토큰값 저장
                    print("token=" + ud.string(forKey: "token")!)
                    
                    self.view.networkResult(resultData: Message, code: "loginSuccess")
                }else if Message.msg == "check login information"{
                    self.view.networkResult(resultData: Message, code: "loginError")
                }else {
                    self.view.networkFailed()
                }
                
            case .failure( _):
                self.view.networkFailed()
            }//switch
        }//Alamofire
    }//function userLogin
    
    
    
    func userSignUp(id: String, pwd:String, name:String, pnumber:String){
        let URL = "\(baseURL)/signup"
        
        let body : [String:String] = [
            "id" : id,
            "pwd" : pwd,
            "name" : name,
            "pnumber" : pnumber,
            "admin" : "1"
        ]
        
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: nil).responseObject{
            (response : DataResponse<msgVO>) in
            switch response.result{
            case .success:
                guard let Message = response.result.value else{
                    self.view.networkFailed()   //result 안들어오면
                    return
                }
                if Message.msg == "join membership success"{
                    self.view.networkResult(resultData: Message, code: "joinSuccess")
                }else if Message.msg == "id duplicated"{
                    self.view.networkResult(resultData: Message, code: "idDuplicated")
                }else {
                    self.view.networkFailed()
                }
                
            case .failure( _):
                self.view.networkFailed()
            }//switch
        }//Alamofire
    }
    
    //   판매자 회원가입
    
    func mgrSignUp(id: String, pwd:String, name:String, pnumber:String, mname : String, mlocation : String, maddress : String){
        let URL = "\(baseURL)/signup"

        let body : [String:String] = [
            "id" : id,
            "pwd" : pwd,
            "name" : name,
            "pnumber" : pnumber,
            "admin" : "2",
            "mname" : mname,
            "mlocation" : mlocation,
            "maddress": maddress
        ]
        
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: nil).responseObject{
            (response : DataResponse<msgVO>) in
            switch response.result{
            case .success:
                guard
                    let Message = response.result.value
                    
                    else{
                        self.view.networkFailed()   //result 안들어오면
                        return
                    }
                
                if Message.msg == "join membership success"{
                    self.view.networkResult(resultData: Message, code: "joinSuccess")
                    
                }else if Message.msg == "id duplicated"{
                    self.view.networkResult(resultData: Message, code: "idDuplicated")
                }else {
                    self.view.networkFailed()
                }
                
            case .failure( _):
                self.view.networkFailed()
            }//switch
        }//Alamofire
    }
    
    
}

