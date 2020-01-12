//
//  ShopImgModel.swift
//  
//
//  Created by leeyunkyung on 2018. 1. 9..
//

import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import SwiftyJSON

class ShopImgModel : NetworkModel {
    
    func getShopImg(mid:Int){
        let URL : String = "\(baseURL)/market/mainimg?mid=\(mid)"
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{
            
            (response : DataResponse<ShopImgVO>) in
            
            switch response.result{
            case .success:
                guard let shopImg = response.result.value else{
                    self.view.networkFailed()
                    return
                }
                
                
                if shopImg.msg == "successful get img data" {
                    if let results =  shopImg.img {
                        self.view.networkResult(resultData: results, code: "Successful Get img Data")
                    }
                }
                else if shopImg.msg == "no img" {
                    self.view.networkResult(resultData: "no img", code: "no img")
                }
                
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
            
        }
        
    }
    
}
