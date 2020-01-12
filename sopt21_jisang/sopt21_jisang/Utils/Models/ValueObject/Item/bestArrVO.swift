//
//  bestArrVO.swift
//  sopt21_jisang
//
//  Created by ubin Kim on 2018. 1. 12..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import Foundation
import ObjectMapper

class bestArrVO : Mappable{
    var pid:Int?
    var pimg:String?
    var location:String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        pid <- map["pid"]
        pimg <- map["pimg"]
        location <- map["location"]
        
    }
}
