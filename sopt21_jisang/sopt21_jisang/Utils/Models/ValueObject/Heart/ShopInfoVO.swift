//
//  ShopInfoVO.swift
//  sopt21_jisang
//
//  Created by leeyunkyung on 2018. 1. 6..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import Foundation
import ObjectMapper

class ShopInfoVO : Mappable{
    var status : String?
    var msg : String?
    var market : ShopNameVO?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        msg <- map["msg"]
        market <- map["market"]
    }
}
