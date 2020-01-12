//
//  noticeModel.swift
//  sopt21_jisang
//
//  Created by ubin Kim on 2018. 1. 7..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//
import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import SwiftyJSON

class noticeModel : NetworkModel {
    func getNoticeList(){
        let URL : String = "\(baseURL)/notice"
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{
            (response : DataResponse<NoticeListVO>) in
            switch response.result{
                
            case .success:
                guard let noticeList = response.result.value
                
                else{
                    self.view.networkFailed()
                    return
                }
                
                //관심매장 리스트 가져오기 성공
                if noticeList.msg == "success get notice data" {
                    if let results = noticeList.noticeArr {
                        self.view.networkResult(resultData: results, code: "noticeSuccess")
                        print("2000000")
                    }
                }
                //관심매장이 없을때
                else if noticeList.msg == "no notice data" {
                    self.view.networkResult(resultData: "noNotice", code: "noticeNull")
                }
                else {
                    self.view.networkFailed()
                }
                
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
            
        }
        
    }//getBoardList
}
