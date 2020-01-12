//
//  NetworkCallback.swift
//  sopt21_jisang
//
//  Created by leeyunkyung on 2018. 1. 1..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

protocol NetworkCallback {
    
    func networkResult(resultData:Any, code:String)
    func networkFailed()
    
}
