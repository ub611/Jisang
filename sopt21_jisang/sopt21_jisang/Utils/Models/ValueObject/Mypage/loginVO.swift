//
//  loginVO.swift
//  sopt21_jisang
//
//  Created by leeyunkyung on 2018. 1. 4..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//
import Foundation
import ObjectMapper

class loginVO : Mappable{
    var id : String?
    var pwd : String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        pwd <- map["pwd"]
    }
}

