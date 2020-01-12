//
//  LocationVC.swift
//  sopt21_jisang
//
//  Created by leeyunkyung on 2018. 1. 1..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import UIKit

class LocationVC: UIViewController {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    
    var location = "강남"
    var loId = 0
    
    func changeCode(loc:String){
        switch loc {
        case "gangnam":
            loId = 201
            break
        case "expressTerminal":
            loId = 202
            break
        default:
            simpleAlert(title: "알림", msg: "지역을 선택해주세요.")
            break
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let locationSegue = segue.destination as! LocationCategoryStoreVC
        
        print("loid = " + loId.description)
        locationSegue.lid = loId
    }
    
    @IBAction func btnGo(_ sender: Any) {
         if name.isHidden  {
            simpleAlert(title: "알림", msg: "지역을 선택해주세요")
        }
        else{
            performSegue(withIdentifier: "gangSG", sender: self)
        }
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.white
        
        name.isHidden = true
        label.isHidden = true
        
      
        
    }
    
    @IBAction func btn1(_ sender: Any) {//강남
        btn1.setImage(#imageLiteral(resourceName: "locationview_click"), for: .normal)
        btn2.setImage(#imageLiteral(resourceName: "locationview_basic"), for: .normal)
        btn3.setImage(#imageLiteral(resourceName: "locationview_basic"), for: .normal)
        btn4.setImage(#imageLiteral(resourceName: "locationview_basic"), for: .normal)
        btn5.setImage(#imageLiteral(resourceName: "locationview_basic"), for: .normal)
        name.isHidden = false
        label.isHidden = false
        name.text = "강남"
        label.text = "바로가기"
        location = "gangnam"
        changeCode(loc: location)
    }
    @IBAction func btn2(_ sender: Any) {//고속터미널
        btn2.setImage(#imageLiteral(resourceName: "locationview_click"), for: .normal)
        btn1.setImage(#imageLiteral(resourceName: "locationview_basic"), for: .normal)
        btn3.setImage(#imageLiteral(resourceName: "locationview_basic"), for: .normal)
        btn4.setImage(#imageLiteral(resourceName: "locationview_basic"), for: .normal)
        btn5.setImage(#imageLiteral(resourceName: "locationview_basic"), for: .normal)
        name.isHidden = false
        label.isHidden = false
        name.text = "고속터미널"
        label.text = "바로가기"
        location = "expressTerminal"
        changeCode(loc: location)

    }
    @IBAction func btn3(_ sender: Any) {//영등포
        btn3.setImage(#imageLiteral(resourceName: "locationview_click"), for: .normal)
        btn2.setImage(#imageLiteral(resourceName: "locationview_basic"), for: .normal)
        btn1.setImage(#imageLiteral(resourceName: "locationview_basic"), for: .normal)
        btn4.setImage(#imageLiteral(resourceName: "locationview_basic"), for: .normal)
        btn5.setImage(#imageLiteral(resourceName: "locationview_basic"), for: .normal)
        name.isHidden = false
        label.isHidden = false
        name.text = "영등포"
        label.text = "바로가기"
    }
    @IBAction func btn4(_ sender: Any) {//부평
        btn4.setImage(#imageLiteral(resourceName: "locationview_click"), for: .normal)
        btn2.setImage(#imageLiteral(resourceName: "locationview_basic"), for: .normal)
        btn3.setImage(#imageLiteral(resourceName: "locationview_basic"), for: .normal)
        btn1.setImage(#imageLiteral(resourceName: "locationview_basic"), for: .normal)
        btn5.setImage(#imageLiteral(resourceName: "locationview_basic"), for: .normal)
        name.isHidden = false
        label.isHidden = false
        name.text = "부평"
        label.text = "바로가기"
        location = "bupyeong"

    }
    @IBAction func btn5(_ sender: Any) {//의정부
        btn5.setImage(#imageLiteral(resourceName: "locationview_click"), for: .normal)
        btn2.setImage(#imageLiteral(resourceName: "locationview_basic"), for: .normal)
        btn3.setImage(#imageLiteral(resourceName: "locationview_basic"), for: .normal)
        btn4.setImage(#imageLiteral(resourceName: "locationview_basic"), for: .normal)
        btn1.setImage(#imageLiteral(resourceName: "locationview_basic"), for: .normal)
        name.isHidden = false
        label.isHidden = false
        name.text = "의정부"
        label.text = "바로가기"
    }
}
