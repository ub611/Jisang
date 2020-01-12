//
//  ProductVO.swift
//  sopt21_jisang
//
//  Created by ubin Kim on 2018. 1. 9..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import Foundation
import ObjectMapper

class ProductVO : Mappable{
    var status : String?
    var msg : String?
    var productArr : [ProductArrVO]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        msg <- map["msg"]
        productArr <- map["productArr"]
    }
}

