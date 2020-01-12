//
//  ProductArrVO.swift
//  sopt21_jisang
//
//  Created by ubin Kim on 2018. 1. 9..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import Foundation
import ObjectMapper

class ProductArrVO : Mappable{
    var pid : Int?
    var name : String?
    var price : String?
    var image : String?
    var mname : String?
    var location : String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        pid <- map["pid"]
        name <- map["name"]
        price <- map["price"]
        image <- map["image"]
        mname <- map["mname"]
        location <- map["location"]
    }
}

