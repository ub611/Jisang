//
//  Search.swift
//  sopt21_jisang
//
//  Created by leeyunkyung on 2018. 1. 12..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import Foundation
import ObjectMapper

class Search : Mappable {
    var keyword : String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        keyword <- map["keyword"]
    }
}

