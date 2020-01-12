//
//  BestVO.swift
//  sopt21_jisang
//
//  Created by ubin Kim on 2018. 1. 7..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import Foundation
import ObjectMapper

class BestVO : Mappable{
    var pid : Int?
    var pimg : String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        pid <- map["pid"]
        pimg <- map["pimg"]
    }
}
