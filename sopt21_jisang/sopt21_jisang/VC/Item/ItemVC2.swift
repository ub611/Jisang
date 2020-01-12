//
//  ItemVC.swift
//  sopt21_jisang
//
//  Created by leeyunkyung on 2018. 1. 1..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import UIKit

class ItemVC2: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegate, NetworkCallback{
    let array:[String] = ["All", "OUTER", "TOP", "PANTS", "SKIRT", "ONEPIECE", "SHOES", "BAC", "ACC"]
    
    var imgArr = [UIImage(named: "only_icon_all_non"), UIImage(named : "only_icon_outer_non"), UIImage(named : "only_icon_top_non"), UIImage(named: "only_icon_bottom_non"), UIImage(named:"only_icon_skirt_non"), UIImage(named: "only_icon_dress_non"), UIImage(named: "only_icon_shoes_non"), UIImage(named: "only_icon_bag_non"), UIImage(named: "only_icon_acc_non")]
    
    var arr = [UIImage(named: "only_icon_all_non"), UIImage(named : "only_icon_outer_non"), UIImage(named : "only_icon_top_non"), UIImage(named: "only_icon_bottom_non"), UIImage(named:"only_icon_skirt_non"), UIImage(named: "only_icon_dress_non"), UIImage(named: "only_icon_shoes_non"), UIImage(named: "only_icon_bag_non"), UIImage(named: "only_icon_acc_non")]
    
    var selectArr = [UIImage(named: "only_icon_all"), UIImage(named : "only_icon_outer"), UIImage(named : "only_icon_top"), UIImage(named: "only_icon_bottom"), UIImage(named:"only_icon_skirt"), UIImage(named: "only_icon_dress"), UIImage(named: "only_icon_shoes"), UIImage(named: "only_icon_bag"), UIImage(named: "only_icon_acc")]
    
    @IBOutlet weak var memberTableView: UITableView!
    
    var pid = 0 //상품코드
    var product: [ProductArrVO] = [ProductArrVO]()
    var best: [bestArrVO] = [bestArrVO]()
    var segueTitle = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.white
        
        imgArr[0] = selectArr[0]    //all이 처음 선택되게
        
        let model = ProductModel(self)
        model.getItemCategory(cid: 301)
        model.getWholebestItem(cid: 301)
        //지역별/카테고리별 상품 가져오기
        }
    
    
    func networkResult(resultData: Any, code: String) {
        if code == "successful" {
            product = resultData as! [ProductArrVO]
            memberTableView.reloadData()
        }
        else if code == "noProduct" {
            simpleAlert(title: "알림", msg: "상품이 없습니다.")
        }
        if code == "bestSuccess"{
            best = resultData as! [bestArrVO]
            memberTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //배너광고
        if indexPath.row == 0 {
            self.memberTableView.rowHeight = 221
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "advertiseCell", for: indexPath) as! AdverCell
            
            
            let scroll = cell.locScrollView
            
            if best.count == 5 {
                for i in 0 ..< 5 {
                    let imgView = UIImageView()
                    
                    if let url = URL(string: gsno(best[i].pimg)){
                        imgView.kf.setImage(with: url)
                        imgView.contentMode = .scaleToFill
                    }
                    
                    var xPosition = Int(self.view.frame.width) * i
                    
                    imgView.frame = CGRect(x: CGFloat(xPosition), y: CGFloat(0), width:  scroll!.frame.width, height: scroll!.frame.height)
                    
                    scroll!.contentSize.width = scroll!.frame.width * CGFloat(i + 1)
                    
                    cell.locScrollView.addSubview(imgView)
                }
            }
            
            
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
                tableView.rowHeight = CGFloat ( 280 * product.count)
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
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! AllItemCell
            
            let vo : ProductArrVO = product[indexPath.row]
            
            if let url = URL(string: gsno(vo.image)){
                cell.itemImg.kf.setImage(with: url)
                cell.itemImg.contentMode = .scaleToFill
            }
            
            cell.itemName.text = vo.name
            cell.itemPric.text = vo.price
            cell.itemShopname.text = vo.mname
            
            if vo.location == "201" {
                cell.location.text = "강남"
            }else if vo.location == "202"{
                cell.location.text = "고속터미널"
            }else {
                cell.location.text = "잠실"
            }
            
            
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
        model.getItemCategory(cid: caid)
        model.getWholebestItem(cid: caid)

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


