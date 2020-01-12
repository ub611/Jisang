//
//  Keyword.swift
//  sopt21_jisang
//
//  Created by leeyunkyung on 2018. 1. 12..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import Foundation
import ObjectMapper

class Keyword : Mappable {
    var productid : Int?
    var name : String?
    var price : String?
    var marketname : String?
    var productimg: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        productid <- map["productid"]
        name <- map["name"]
        price <- map["price"]
        marketname <- map["marketname"]
        productimg <- map["productimg"]
    }
}

