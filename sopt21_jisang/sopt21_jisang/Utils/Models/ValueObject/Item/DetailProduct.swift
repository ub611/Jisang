//
//  ItemVO.swift
//  sopt21_jisang
//
//  Created by ubin Kim on 2018. 1. 10..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import Foundation
import ObjectMapper

class DetailProduct : Mappable {
    var status : String?
    var msg : String?
    var product : DetailProductList?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        msg <- map["msg"]
        product <- map["product"]
    }
}
