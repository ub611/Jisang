//
//  ItemDetailVC.swift
//  sopt21_jisang
//
//  Created by ubin Kim on 2018. 1. 9..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import UIKit

class ItemDetailVC: UIViewController {
    @IBOutlet weak var htImg: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.barTintColor = UIColor.white
        // Do any additional setup after loading the view.
    }
    @IBAction func btnBookmark(_ sender: Any) {
        
        //viewwillAppear에서 네트워킹 !!!!ㄴ
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
