//
//  ItemListVO.swift
//  sopt21_jisang
//
//  Created by ubin Kim on 2018. 1. 10..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import Foundation
import ObjectMapper

class DetailProductList : Mappable{
    var name : String?
    var imageArr : [imageArrVO]?
    var price : String?
    var detail : String?
    var mid : Int?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        imageArr <- map["imageArr"]
        price <- map["price"]
        detail <- map["detail"]
        mid <- map["mid"]

    }
}
