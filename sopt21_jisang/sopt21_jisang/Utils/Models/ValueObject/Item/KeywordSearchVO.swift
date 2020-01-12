//
//  KeywordSearchVO.swift
//  sopt21_jisang
//
//  Created by leeyunkyung on 2018. 1. 12..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import Foundation
import ObjectMapper

class KeywordSearchVO : Mappable{
    var status : String?
    var msg : String?
    var productArr : [Keyword]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        msg <- map["msg"]
        productArr <- map["productArr"]
    }
}

