//
//  QuestionListVO.swift
//  sopt21_jisang
//
//  Created by leeyunkyung on 2018. 1. 8..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import Foundation
import ObjectMapper

class QuestionListVO : Mappable{
    var status : String?
    var msg : String?
    var question : [QuestionVO]?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        status <- map["status"]
        msg <- map["msg"]
        question <- map["question"]
        
    }
}


