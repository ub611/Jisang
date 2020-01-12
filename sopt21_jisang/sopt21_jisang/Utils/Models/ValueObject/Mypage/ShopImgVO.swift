//
//  ShopImgVO.swift
//  sopt21_jisang
//
//  Created by leeyunkyung on 2018. 1. 9..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import Foundation
import ObjectMapper

class ShopImgVO : Mappable{
    var status : String?
    var msg : String?
    var img : String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        status <- map["status"]
        msg <- map["msg"]
        img <- map["img.marketimg"]
        
    }
}
