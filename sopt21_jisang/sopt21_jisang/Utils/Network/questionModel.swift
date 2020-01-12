//
//  questionModel.swift
//  sopt21_jisang
//
//  Created by leeyunkyung on 2018. 1. 8..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import SwiftyJSON

//문의목록
class questionModel : NetworkModel {
    let data = UserDefaults.standard
    
    func gequestionList(){
        let URL : String = "\(baseURL)/question/user"
        let headers : HTTPHeaders = ["token" : data.string(forKey: "token")!]
        
        Alamofire.request(URL, method: .get, headers : headers ).responseObject{
            (response : DataResponse<QuestionListVO>) in
            
            switch response.result{
            case .success:
                guard let questionList = response.result.value else{
                    self.view.networkFailed()
                    return
                }
                
                //문의목록리스트 가져오기 성공
                if questionList.msg == "successful get question data" {
                    if let results = questionList.question {
                        print("success")
                        self.view.networkResult(resultData: results, code: "questionList Success")
                        print("success2")
                    }
                }
                    
                    //문의목록이 없을때
                else if questionList.msg == "no questions" {
                    print("fail")
                    self.view.networkResult(resultData: "no question data", code: "no questions")
                }
                
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
            
        }
        
    }
}
