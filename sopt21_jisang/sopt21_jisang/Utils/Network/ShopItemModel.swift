//
//  ShopItemModel.swift
//  sopt21_jisang
//
//  Created by leeyunkyung on 2018. 1. 6..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import SwiftyJSON

class ShopItemModel : NetworkModel {
    //매장아이템가져오기
    func getItemList(mid:Int){
        let URL : String = "\(baseURL)/product/market?mid=\(mid)"
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{
            
            (response : DataResponse<ShopItemVO>) in
            
            switch response.result{
                
            case .success:
                guard let itemList = response.result.value else{
                    self.view.networkFailed()
                    return
                }
                
                //관심매장 리스트 가져오기 성공
                if itemList.msg == "market item list" {
                    if let results = itemList.productArr {
                        self.view.networkResult(resultData: results, code: "itemlist Success")
                    }
                }
                    
                    //관심매장이 없을때
                else if favoriteList.msg == "No Products" {
                    self.view.networkResult(resultData: "no products", code: "no products")
                }
                
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
            
        }
        
    }//getItemList
}

