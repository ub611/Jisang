//
//  imageArrVO.swift
//  sopt21_jisang
//
//  Created by ubin Kim on 2018. 1. 10..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import Foundation
import ObjectMapper

class imageArrVO : Mappable{
    var ilocation : String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        ilocation <- map["ilocation"]
    }

}
