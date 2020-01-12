//
//  SearchPasswdVC.swift
//  sopt21_jisang
//
//  Created by leeyunkyung on 2018. 1. 3..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import UIKit

class SearchPasswdVC: UIViewController {

    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.white
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
