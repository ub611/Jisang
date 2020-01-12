//
//  favoriteListModel.swift
//  sopt21_jisang
//
//  Created by leeyunkyung on 2018. 1. 5..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import SwiftyJSON

//개인의 북마크
class favoriteListModel : NetworkModel {
    let data = UserDefaults.standard

    func getFavoriteList(){
        let URL : String = "\(baseURL)/bookmark"
        
        let headers : HTTPHeaders = ["token" : data.string(forKey: "token")!]
        Alamofire.request(URL, method: .get, headers : headers ).responseObject{

            (response : DataResponse<FavoriteShopVO>) in
            
            switch response.result{
                
            case .success:
                guard let favoriteList = response.result.value else{
                    self.view.networkFailed()
                    return
                }
                
                //관심매장 리스트 가져오기 성공
                if favoriteList.msg == "successful get favorites data" {
                    if let results = favoriteList.list {
                        print("success")
                        self.view.networkResult(resultData: results, code: "favoriteList Success")
                    }
                }
                    
                //관심매장이 없을때
                else if favoriteList.msg == "no bookmark" {
                    print("fail")
                    self.view.networkResult(resultData: "no bookmark", code: "no bookmark")
                }
                
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
            
        }
        
    }//getBoardList
    
    func isBookmarked(mid:Int){
        let URL : String = "\(baseURL)/bookmark/market?mid=\(mid)"
        
        if data.string(forKey: "token") != nil {
        let headers : HTTPHeaders = ["token" : data.string(forKey: "token")!]
        
            Alamofire.request(URL, method: .get, headers : headers ).responseObject{
                
                (response : DataResponse<BookmarkedVO>) in
                
                switch response.result{
                    
                case .success:
                    guard let book = response.result.value else{
                        self.view.networkFailed()
                        return
                    }
                    
                    //관심매장 리스트 가져오기 성공
                    if book.msg == "get bookmark data success" {
                        self.view.networkResult(resultData: book, code: "isBookmarked")
                    }
                        
                        //관심매장이 없을때
                    else if book.msg == "no bookmark" {
                        print("fail")
                        self.view.networkResult(resultData: "no bookmark", code: "noBookmark")
                    }
                    
                case .failure(let err):
                    print(err)
                    self.view.networkFailed()
                }
                
            }
        }
        
    }
    
    func getBookmarked(mid:Int){
        let URL : String = "\(baseURL)/bookmark/market"
        
        let headers : HTTPHeaders = ["token" : data.string(forKey: "token")!]
        Alamofire.request(URL, method: .post, parameters:["mid":mid], headers : headers ).responseObject{
            
            (response : DataResponse<msgVO>) in
            
            switch response.result{
                
            case .success:
                guard let msgvo = response.result.value else{
                    self.view.networkFailed()
                    return
                }
                print(msgvo.msg)
                if msgvo.msg == "successful update bookmark" {
                    if let results = msgvo.msg {
                        self.view.networkResult(resultData: results, code: "success")
                    }
                }else if msgvo.msg == "not logged in"{
                    self.view.networkResult(resultData: "token", code: "tok")
                }
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
            
        }
        
    }
    
    
    
}
