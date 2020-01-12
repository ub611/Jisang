//
//  FavoriteVO.swift
//  sopt21_jisang
//
//  Created by leeyunkyung on 2018. 1. 4..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//
import Foundation
import ObjectMapper

class FavoriteVO : Mappable{
    var mid : Int?
    var mimage : String?
    var mname : String?
    var location : String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        mid <- map["mid"]
        mimage <- map["mimage"]
        mname <- map["mname"]
        location <- map["location"]
    }
}
