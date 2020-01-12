//
//  SearchModel.swift
//  sopt21_jisang
//
//  Created by leeyunkyung on 2018. 1. 12..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//
import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import SwiftyJSON

class SearchModel : NetworkModel {
    func getSearchList(){
        let URL : String = "\(baseURL)/hashtag/list"
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{
            (response : DataResponse<SearchVO>) in
            switch response.result{
                
            case .success:
                guard let searchlist = response.result.value
                    
                    else{
                        self.view.networkFailed()
                        return
                }
                
                if searchlist.msg == "success get hastags" {
                    if let results = searchlist.hashtagArr {
                        self.view.networkResult(resultData: results, code: "success get hastags")
                        print("2000000")
                    }
                }
                else if searchlist.msg == "no search data" {
                    self.view.networkResult(resultData: "no search data", code: "no search data")
                }
                else {
                    self.view.networkFailed()
                }
                
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
            
        }
    }
    func getKeywordList(hashname:String){
        var URL : String = "\(baseURL)/hashtag?hashname="
        let query = "\(hashname)"
        let encode = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        URL = URL + encode
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{
            (response : DataResponse<KeywordSearchVO>) in
            switch response.result{
                
            case .success:
                guard let keywordlist = response.result.value
                    
                    else{
                        self.view.networkFailed()
                        return
                }
                
                if keywordlist.msg == "successful get hashed products" {
                    if let results = keywordlist.productArr {
                        self.view.networkResult(resultData: results, code: "hashed")
                        print("20000001111")
                        print("hashed = " + results.count.description)
                    }
                }
                else if keywordlist.msg == "no products" {
                    self.view.networkResult(resultData: "no products", code: "no products")
                }
                else {
                    self.view.networkFailed()
                }
                
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
            
        }
        
    }
}

