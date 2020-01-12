//
//  ItemVC.swift
//  sopt21_jisang
//
//  Created by leeyunkyung on 2018. 1. 1..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import UIKit

class LocationCategoryStoreVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegate, NetworkCallback{
    let array:[String] = ["All", "OUTER", "TOP", "PANTS", "SKIRT", "ONEPIECE", "SHOES", "BAC", "ACC"]
    
    var imgArr = [UIImage(named: "only_icon_all_non"), UIImage(named : "only_icon_outer_non"), UIImage(named : "only_icon_top_non"), UIImage(named: "only_icon_bottom_non"), UIImage(named:"only_icon_skirt_non"), UIImage(named: "only_icon_dress_non"), UIImage(named: "only_icon_shoes_non"), UIImage(named: "only_icon_bag_non"), UIImage(named: "only_icon_acc_non")]
    
    var arr = [UIImage(named: "only_icon_all_non"), UIImage(named : "only_icon_outer_non"), UIImage(named : "only_icon_top_non"), UIImage(named: "only_icon_bottom_non"), UIImage(named:"only_icon_skirt_non"), UIImage(named: "only_icon_dress_non"), UIImage(named: "only_icon_shoes_non"), UIImage(named: "only_icon_bag_non"), UIImage(named: "only_icon_acc_non")]
    
    var selectArr = [UIImage(named: "only_icon_all"), UIImage(named : "only_icon_outer"), UIImage(named : "only_icon_top"), UIImage(named: "only_icon_bottom"), UIImage(named:"only_icon_skirt"), UIImage(named: "only_icon_dress"), UIImage(named: "only_icon_shoes"), UIImage(named: "only_icon_bag"), UIImage(named: "only_icon_acc")]
    
    @IBOutlet weak var memberTableView: UITableView!
 
    var lid = 0 //지역코드
    var pid = 0 //상품코드
    var product: [ProductArrVO] = [ProductArrVO]()
    var segueTitle = ""
    var timer : Timer!
    var updateCount = 0
    
    var pc : UIPageControl?
    var iv : UIImageView?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.white
        
        imgArr[0] = selectArr[0]    //all이 처음 선택되게
        
        let model = ProductModel(self)
        model.getCategoryItem(lid: lid, cid: 301)
            //지역별/카테고리별 상품 가져오기
        
        timer = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(LocationCategoryStoreVC.updateTimer), userInfo: nil, repeats: true)
        
        
        
    }
    
    
    func networkResult(resultData: Any, code: String) {
        if code == "successful" {
            product = resultData as! [ProductArrVO]
            memberTableView.reloadData()
        }
        else if code == "noProduct" {
            simpleAlert(title: "알림", msg: "상품이 없습니다.")
        }
    }
    
    @objc internal func updateTimer(){
        if updateCount == 0 {
            pc?.currentPage = updateCount
            iv?.image = UIImage(named : "1" + ".png")
            updateCount = updateCount + 1
        }
        else if updateCount <= 4 {
            pc?.currentPage = updateCount
            iv?.image = UIImage(named : String(updateCount + 1) + ".png")
            updateCount = updateCount + 1
        }else {
            updateCount = 0

        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        //배너광고
        if indexPath.row == 0 {
            self.memberTableView.rowHeight = 221
            
           let cell = tableView.dequeueReusableCell(withIdentifier: "advertiseCell", for: indexPath) as! AdverCell
            
            
            var txt = ""
           
            if lid == 201{
                txt = "강남"
            }else if lid == 202{
                txt = "고속터미널"
            }else {
                txt = "부평"
            }
            cell.locLabel.text = "오늘의 #" + txt + " HOT ITEM"
            
            iv = cell.imgView
            pc = cell.pageControl
            
            
           
            return cell
        }
            
            
        //카테고리 뷰
        else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "categoryTable", for: indexPath) as! CategoryTableCell
            self.memberTableView.rowHeight = 60
            cell.categoryCollectionView.delegate = self
            cell.categoryCollectionView.dataSource = self
            cell.categoryCollectionView.tag = indexPath.row
            cell.categoryCollectionView.reloadData()
            return cell
        }
        
        //카테고리별 아이템
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "locItemTableCell", for: indexPath) as! LocationItemTableCell
            cell.LocItemCollectionView.delegate = self
            cell.LocItemCollectionView.dataSource = self
            
            if product.count > 2 {
                tableView.rowHeight = CGFloat(300 * product.count / 2)
            } else {
                tableView.rowHeight = CGFloat ( 270 * product.count)
            }
            
            cell.LocItemCollectionView.tag = indexPath.row
            cell.LocItemCollectionView.reloadData()
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1{
            return 9
        }else {
            return product.count
            //여기에 네트워킹 ~~~~~
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //카테고리
        if collectionView.tag == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CategoryCollCell
        
            cell.cateImg.image =  imgArr[indexPath.row]
            cell.cateLabel.text =  array[indexPath.row]
            
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "locItemCell", for: indexPath) as! LocationItemCollectionCell
            
            let vo : ProductArrVO = product[indexPath.row]
            
            if let url = URL(string: gsno(vo.image)){
                cell.locItemCollImg.kf.setImage(with: url)
                cell.locItemCollImg.contentMode = .scaleToFill
            }
        
            cell.locItemCollName.text = vo.name
            cell.locItemCollPrice.text = vo.price
            cell.locShopName.text = vo.mname
            
            
            return cell
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 1 {
            switch indexPath.row {
            case 0 :
                initCategory(caid: 301, ind: indexPath.row)
                break
            case 1 :
                initCategory(caid: 302, ind: indexPath.row)
                break
            case 2:
                initCategory(caid: 303, ind: indexPath.row)

                break
            case 3:
                initCategory(caid: 304, ind: indexPath.row)

                break
            case 4:
                initCategory(caid: 307, ind: indexPath.row)
                
                break
            case 5:
                initCategory(caid: 306, ind: indexPath.row)
                
                break
            case 6:
                initCategory(caid: 305, ind: indexPath.row)
                
                break
            case 7:
                initCategory(caid: 308, ind: indexPath.row)
                
                break
            case 8 :
                initCategory(caid: 309, ind: indexPath.row)
                
                break
            default:
                break
            }
            collectionView.reloadData()
        }
        
        else {
            pid = product[indexPath.row].pid!
            print("pid = " + pid.description)
            segueTitle = product[indexPath.row].mname!
            performSegue(withIdentifier: "locationSegue", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let sg = segue.destination as! LocationDetailStoreVC
        sg.id = pid
        sg.tit = segueTitle
    }
    
    func initCategory(caid: Int, ind : Int){
        let model = ProductModel(self)
        model.getCategoryItem(lid: lid, cid: caid)
        imgArr = arr
        imgArr[ind] = selectArr[ind]
    }
    
    
    @IBAction func btnItemSearch(_ sender: Any) {
        print("btnItem")
        //        self.definesPresentationContext = true
        let searchVC = LocationSearchVC()
        searchVC.modalTransitionStyle = .crossDissolve
        searchVC.modalPresentationStyle = .overCurrentContext
        self.present(searchVC, animated: true, completion: nil)
    }
    
    @IBAction func btnBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
        dismiss(animated: true, completion: nil)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
 
}


