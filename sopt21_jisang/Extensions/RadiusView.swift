//
//  RadiusView.swift
//  sopt21_jisang
//
//  Created by ubin Kim on 2018. 1. 1..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//
import UIKit

@IBDesignable
class RadiusView: UIView {
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
