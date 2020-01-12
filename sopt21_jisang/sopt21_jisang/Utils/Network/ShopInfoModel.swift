//
//  ShopInfoModel.swift
//  sopt21_jisang
//
//  Created by leeyunkyung on 2018. 1. 6..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import SwiftyJSON

class ShopInfoModel : NetworkModel {
    //매장정보(이름/address)가져오기
    func getShopInfo(mid:Int){
        let URL : String = "\(baseURL)/market/info?mid=\(mid)"
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{
            
            (response : DataResponse<ShopInfoVO>) in
    
            switch response.result{
            case .success:
                guard let shopInfo = response.result.value else{
                    self.view.networkFailed()
                    return
                }
                
                //매장정보 가져오기 성공
                if shopInfo.msg == "successful market info" {
                    if let results =  shopInfo.market {
                        self.view.networkResult(resultData: results, code: "market info Success")
                        
                    }
                }
                    
                    //매장정보가 없을때
                else if shopInfo.msg == "no data" {
                    self.view.networkResult(resultData: "no data", code: "no data")
                }
                
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
            
        }
        
    }
    
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
                else if itemList.msg == "No Products" {
                    self.view.networkResult(resultData: "no products", code: "no products")
                }
                
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
        }
    }//getItemList
    
    func getShopBestList(mid:Int){      //매장별 베스트 아이템
        let URL : String = "\(baseURL)/product/market/best?mid=\(mid)"
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{
            (response : DataResponse<BestItemVO>) in
            switch response.result{
            case .success:
                guard let bestList = response.result.value
                    else{
                        self.view.networkFailed()
                        return
                }
                
                //best item리스트 가져오기 성공
                if bestList.msg == "market best item list" {
                    if let results = bestList.bestArr {
                        self.view.networkResult(resultData: results, code: "bestList Success")
                    }
                }
                    //best item이 없을때
                else if bestList.msg == "no data" {
                    self.view.networkResult(resultData: "no best data", code: "no best data")
                }
                
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
            
        }
    }//getBestList
}
