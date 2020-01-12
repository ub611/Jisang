//
//  ViewController.swift
//  sopt21_jisang
//
//  Created by leeyunkyung on 2018. 1. 1..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let data = UserDefaults.standard
        let us = data.integer(forKey: "admin")
        print("us : " + us.description)
    }

}

