//
//  NotiveVO.swift
//  sopt21_jisang
//
//  Created by ubin Kim on 2018. 1. 7..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import Foundation
import ObjectMapper

class NoticeVO : Mappable{
    var nid : Int?
    var title : String?
    var content : String?
    var ndate : String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        nid <- map["nid"]
        title <- map["title"]
        content <- map["content"]
        ndate <- map["ndate"]
    }
}

