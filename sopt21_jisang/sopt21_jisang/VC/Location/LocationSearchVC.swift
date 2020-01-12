//
//  LocationSearchVC.swift
//  sopt21_jisang
//
//  Created by leeyunkyung on 2018. 1. 4..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import UIKit

class LocationSearchVC: UIViewController,UITextFieldDelegate {
    @IBOutlet var LocationSearch: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Location Search View")
        self.LocationSearch.delegate = self // as! UITextFieldDelegate
    }
    override func viewWillDisappear(_ animated: Bool) {
        print(LocationSearch.text!)
        self.dismiss(animated: false, completion: nil)
        
    }
    
    @IBAction func btnBackItem_Location(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }


}
