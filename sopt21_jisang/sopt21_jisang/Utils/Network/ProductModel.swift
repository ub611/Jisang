//
//  ProductModel.swift
//  sopt21_jisang
//
//  Created by ubin Kim on 2018. 1. 9..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import Foundation
import ObjectMapper
import AlamofireObjectMapper
import SwiftyJSON
import Alamofire

class ProductModel : NetworkModel {
    let data = UserDefaults.standard
    
     //상품 상세정보 가져오기
    func getItemInform(pid:Int){
        let URL : String = "\(baseURL)/product?pid=\(pid)"
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{
            (response : DataResponse<DetailProduct>) in
            switch response.result{
            case .success:
                guard let proVo = response.result.value
                    else{
                        self.view.networkFailed()
                        return
                }
                if proVo.msg == "successful get product data"{
                    if let results = proVo.product {
                        self.view.networkResult(resultData: results, code: "productOk")
                    }
                }else if proVo.msg == "no such product"{
                    self.view.networkResult(resultData: "No Data", code: "noProduct")
                }else {
                    self.view.networkFailed()
                }
                
                break
            case .failure( _):
                self.view.networkFailed()
            }//switch
        }//Alamofire
    }
    
    func getWholebestItem(cid:Int){
        let URL : String = "\(baseURL)/product/whole/best"
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{
            (response : DataResponse<WholeBestVO>) in
            switch response.result{
            case .success:
                guard let bestList = response.result.value
                    else{
                        self.view.networkFailed()
                        return
                }
                
                if bestList.msg == "successful get best products"{
                    if let results = bestList.bestArr {
                        self.view.networkResult(resultData: results, code: "bestSuccess")
                    }
                }else {
                    self.view.networkFailed()
                }
                
            case .failure( _):
                self.view.networkFailed()
            }//switch
        }//Alamofire
        
    }
    
    func getItemCategory(cid:Int){
        let URL : String = "\(baseURL)/product/whole/category?category=\(cid)"
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{
            (response : DataResponse<ProductVO>) in
            switch response.result{
            case .success:
                guard let productList = response.result.value
                    else{
                        self.view.networkFailed()
                        return
                }
                
                if productList.msg == "successful get products"{
                    if let results = productList.productArr {
                        self.view.networkResult(resultData: results, code: "successful")
                    }
                }else if productList.msg == "no products data"{
                    self.view.networkResult(resultData: "No Data", code: "noProduct")
                }else {
                    self.view.networkFailed()
                }
                
            case .failure( _):
                self.view.networkFailed()
            }//switch
        }//Alamofire
        
    }
    
    func getCategoryItem(lid:Int, cid:Int){
        let URL : String = "\(baseURL)/product/mall/category?category=\(cid)&location=\(lid)"
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{
            (response : DataResponse<ProductVO>) in
            switch response.result{
            case .success:
                guard let productList = response.result.value
                    else{
                        self.view.networkFailed()
                        return
                }
                
                if productList.msg == "successful get products"{
                    if let results = productList.productArr {
                        self.view.networkResult(resultData: results, code: "successful")
                    }
                }else if productList.msg == "no products data"{
                    self.view.networkResult(resultData: "No Data", code: "noProduct")
                }else {
                    self.view.networkFailed()
                }
                
            case .failure( _):
                self.view.networkFailed()
            }//switch
        }//Alamofire
        
    }
}
