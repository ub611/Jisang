//
//  FavoriteShopVO.swift
//  sopt21_jisang
//
//  Created by leeyunkyung on 2018. 1. 5..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import Foundation
import ObjectMapper

class FavoriteShopVO : Mappable{
    var status : String?
    var msg : String?
    var list : [FavoriteVO]?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        status <- map["status"]
        msg <- map["msg"]
        list <- map["list"]
        
    }
}
