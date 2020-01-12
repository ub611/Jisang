//
//  LocationDetailStoreVC.swift
//  sopt21_jisang
//
//  Created by leeyunkyung on 2018. 1. 2..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import UIKit

class LocationDetailStoreVC: UIViewController, NetworkCallback, UITableViewDataSource, UITableViewDelegate {
    
    let data = UserDefaults.standard
    @IBOutlet weak var memberTable: UITableView!
    @IBOutlet weak var htBtnImg: UIBarButtonItem!
    
    var id = 0
    var product: DetailProductList?
    var book: BookmarkedVO?
    
    var memMid = 0
    var tit = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.white
        
        self.navigationItem.title = tit
        
        let model = ProductModel(self)
        model.getItemInform(pid: id)
        
        memberTable.rowHeight = UITableViewAutomaticDimension
        a()
    }
    
    @IBAction func btnBookmark(_ sender: Any) {
        //상태변경, 북마크인지 확인 후 하트 변경
        
        if data.string(forKey: "token") != nil {
            let model = favoriteListModel(self)
            model.getBookmarked(mid: memMid)
        }
        else {
          simpleAlert(title: "알림", msg: "로그인 후 이용해주세요")
        }
     
    }
    
    func a(){
        let model = favoriteListModel(self)
        model.isBookmarked(mid: memMid)
        
        if book?.bookmarked == "1"{
            htBtnImg.image = #imageLiteral(resourceName: "navi_jjim")
        }else {
            htBtnImg.image = #imageLiteral(resourceName: "navi_not jjim")
        }
        
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.row == 0)
        {        tableView.rowHeight = 387

            let cell = tableView.dequeueReusableCell(withIdentifier: "detail", for: indexPath) as! LocDetailImgCell
         
            if product?.imageArr?.count != 0 {
                if let url = URL(string: gsno(product?.imageArr?[0].ilocation)){
                    cell.detailImg.kf.setImage(with: url)
                    cell.detailImg.contentMode = .scaleToFill
                }
            } else {
                cell.detailImg.image =  #imageLiteral(resourceName: "big_size_preparation")
            }

            return cell
        }
        
        else if indexPath.row == 1 {
            tableView.rowHeight = 55
            let cell = tableView.dequeueReusableCell(withIdentifier: "LocBtnCell", for: indexPath) as! LocBtnCell
            
//            cell.selectionStyle = UITableViewCellSelectionStyle.none
        
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LocDtailLabelCell", for: indexPath) as! LocDtailLabelCell
            
            cell.itemName.text = product?.name
            cell.itemPrice.text = product?.price
            cell.itemDetail.text = product?.detail
          
            cell.itemDetail.adjustsFontForContentSizeCategory = true
            cell.itemDetail.sizeToFit()
            cell.itemDetail.isScrollEnabled = false
            
            tableView.rowHeight = cell.itemDetail.bounds.size.height  + 120
            
            return cell
            
        }
    }
    
    func networkResult(resultData: Any, code: String) {
        if code == "productOk"{ //getItemInform
            product = resultData as? DetailProductList
            print((product?.mid)!)
            memMid = (product?.mid)!
            if data.string(forKey: "token") != nil {
                a()
            }
        }else if code == "noProduct"{
            simpleAlert(title: "알림", msg: "상품정보가 없습니다.")
        }
        if code == "isBookmarked"{  //isBookmarked
            book = resultData as! BookmarkedVO
        }
        if code == "success"{   //getBookmark
            a()
            simpleAlert(title: "알림", msg: "관심매장 상태가 변경되었습니다.")
        }else if code == "tok" {
            simpleAlert(title: "알림", msg: "로그인 후 이용해주세요.")
        }
        
        memberTable.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goShop"{
            let locationSegue = segue.destination as! HeartDetailShopVC
            locationSegue.id = memMid
        }else {
            
        }
    
    }
    
    @IBAction func btnMap(_ sender: Any) {
//        print("1")
        
    let test = UIStoryboard(name: "Location", bundle: nil)
    let vc = test.instantiateViewController(withIdentifier: "Map")
        self.navigationController?.pushViewController(vc, animated: true)
        //        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "Map") as! ShowMapVC
//        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    @IBAction func btnBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
        dismiss(animated: true, completion: nil)
     
    }
    @IBAction func btnQuestion(_ sender: Any) {
        simpleAlert(title: "알림", msg: "서비스 준비중입니다.")
    }
    
}
