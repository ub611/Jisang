//
//  ItemSearchVC.swift
//  sopt21_jisang
//
//  Created by ubin Kim on 2018. 1. 2..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import UIKit

class ItemSearchVC: UIViewController, UITextFieldDelegate {
    @IBOutlet var tfSearch: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Item Search View")
        navigationController?.navigationBar.barTintColor = UIColor.white
        self.tfSearch.delegate = self // as! UITextFieldDelegate
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print(tfSearch.text!)
        self.dismiss(animated: false, completion: nil)
        
    }
    
    @IBAction func btnBackItem(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

