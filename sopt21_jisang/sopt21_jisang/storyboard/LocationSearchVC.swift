//
//  ItemSearchVC.swift
//  sopt21_jisang
//
//  Created by ubin Kim on 2018. 1. 2..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import UIKit

class LocationSearchVC: UIViewController, UITextFieldDelegate,NetworkCallback {
    @IBOutlet var tfSearch: UITextField!
    var searchList : [Search] = [Search]()
    
    @IBOutlet weak var h1: UILabel!
    @IBOutlet weak var h2: UILabel!
    @IBOutlet weak var h3: UILabel!
    @IBOutlet weak var h4: UILabel!
    @IBOutlet weak var h5: UILabel!
    @IBOutlet weak var h6: UILabel!
    @IBOutlet weak var h7: UILabel!
    @IBOutlet weak var h8: UILabel!
    @IBOutlet weak var h9: UILabel!
    @IBOutlet weak var h10: UILabel!
    @IBOutlet weak var h11: UILabel!
    @IBOutlet weak var h12: UILabel!
    @IBOutlet weak var h13: UILabel!
    @IBOutlet weak var h14: UILabel!
    @IBOutlet weak var h15: UILabel!
    @IBOutlet weak var h16: UILabel!
    @IBOutlet weak var h17: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.white
        print("Item Search View")
        self.tfSearch.delegate = self // as! UITextFieldDelegate
        
        let model = SearchModel(self)
        model.getSearchList()
    }
    func networkResult(resultData: Any, code: String) {
        if code == "success get hastags" {
            searchList = resultData as! [Search]
        }
        else if code == "no search data" {
            simpleAlert(title: "알림", msg: "해쉬태그가 없습니다")
        }
        
        h1.text = "#" + searchList[0].keyword!
        h2.text = "#" + searchList[1].keyword!
        h3.text = "#" + searchList[2].keyword!
        h4.text = "#" + searchList[3].keyword!
        h5.text = "#" + searchList[4].keyword!
        h6.text = "#" + searchList[5].keyword!
        h7.text = "#" + searchList[6].keyword!
        h8.text = "#" + searchList[7].keyword!
        h9.text = "#" + searchList[8].keyword!
        h10.text = "#" + searchList[9].keyword!
        h11.text = "#" + searchList[10].keyword!
        h12.text = "#" + searchList[11].keyword!
        h13.text = "#" + searchList[12].keyword!
        h14.text = "#" + searchList[13].keyword!
        h15.text = "#" + searchList[14].keyword!
        h16.text = "#" + searchList[15].keyword!
        h17.text = "#" + searchList[16].keyword!
        
        
    }
    @IBAction func btn_search(_ sender: Any) {
        let data = UserDefaults.standard
        print(tfSearch.text!)
        var text = tfSearch.text!
//        let encodeQuery = text.addingPercentEncoding(withAllowedCharacters: UTF8)

        data.set(tfSearch.text!, forKey: "hashname")
        
        
        let test = UIStoryboard(name: "Location", bundle: nil)
        let vc = test.instantiateViewController(withIdentifier: "locResultSB")
        self.present(vc, animated: true, completion: nil)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        print(tfSearch.text!)
        self.dismiss(animated: false, completion: nil)
        
    }
    
    @IBAction func btnBackItem(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}


