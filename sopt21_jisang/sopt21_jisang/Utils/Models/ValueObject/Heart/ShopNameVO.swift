//
//  ShopNameVO.swift
//  sopt21_jisang
//
//  Created by leeyunkyung on 2018. 1. 6..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import Foundation
import ObjectMapper

class ShopNameVO : Mappable{
    var name : String?
    var mid : Int?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        name <- map["name"]
        mid <- map["mid"]
    }
}

