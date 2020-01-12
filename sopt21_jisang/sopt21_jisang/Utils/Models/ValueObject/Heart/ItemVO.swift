//
//  ItemVO.swift
//  sopt21_jisang
//
//  Created by leeyunkyung on 2018. 1. 6..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import Foundation
import ObjectMapper

class ItemVO : Mappable{
    var pid : Int?
    var name : String?
    var price : String?
    var image : String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        pid <- map["pid"]
        name <- map["name"]
        price <- map["price"]
        image <- map["image"]
    }
}

