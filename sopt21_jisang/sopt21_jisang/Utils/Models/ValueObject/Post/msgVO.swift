//
//  msgVO.swift
//  sopt21_jisang
//
//  Created by leeyunkyung on 2018. 1. 4..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import Foundation
import ObjectMapper


class msgVO : Mappable{
    var status : String?
    var msg : String?
    var data : loginMsgVO?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        msg <- map["msg"]
        data <- map["data"]
    }
}
