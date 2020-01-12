//
//  BestVO.swift
//  sopt21_jisang
//
//  Created by ubin Kim on 2018. 1. 12..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import Foundation
import ObjectMapper

class WholeBestVO : Mappable{
    var msg:String?
    var status:String?
    var bestArr:[bestArrVO]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        msg <- map["msg"]
        status <- map["status"]
        bestArr <- map["bestArr"]
        
    }
}
