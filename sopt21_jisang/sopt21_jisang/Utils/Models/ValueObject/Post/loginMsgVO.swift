//
//  loginMsgVO.swift
//  sopt21_jisang
//
//  Created by ubin Kim on 2018. 1. 7..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import Foundation
import ObjectMapper

class loginMsgVO : Mappable{
    var admin : Int?
    var token: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        admin <- map["admin"]
        token <- map["token"]
    }
}

