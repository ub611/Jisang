//
//  NoticeListVO.swift
//  sopt21_jisang
//
//  Created by ubin Kim on 2018. 1. 7..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import Foundation
import ObjectMapper


class NoticeListVO : Mappable{
    var status : String?
    var msg : String?
    var noticeArr : [NoticeVO]?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        status <- map["status"]
        msg <- map["msg"]
        noticeArr <- map["noticeArr"]
        
    }
}

