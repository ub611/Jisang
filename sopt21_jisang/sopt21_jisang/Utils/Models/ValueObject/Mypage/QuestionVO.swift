//
//  QuestionVO.swift
//  sopt21_jisang
//
//  Created by leeyunkyung on 2018. 1. 8..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import Foundation
import ObjectMapper

class QuestionVO : Mappable{
    var mname : String?
    var mimage : String?
    var pid : Int?
    var qdate : String?
    var content : String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
         mname <- map["mname"]
         mimage <- map["mimage"]
         pid <- map["pid"]
         qdate <- map["qdate"]
         content <- map["content"]
        
    }
}

