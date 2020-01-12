//
//  HeartDetailShopVC.swift
//  sopt21_jisang
//
//  Created by leeyunkyung on 2018. 1. 3..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//



//매장위치 선택시 지도 뜨게 해주기 ~~!

import UIKit
import Kingfisher

class HeartDetailShopVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,NetworkCallback, UICollectionViewDelegateFlowLayout{
    @IBOutlet weak var btnImg: UIBarButtonItem!
    
    @IBOutlet weak var heartCollectionView: UICollectionView!
    private var cvDataSource: UICollectionViewDataSource!
    @IBOutlet weak var titleLabel: UILabel!
    
    let data = UserDefaults.standard
  
    var product: DetailProductList?
    var book: BookmarkedVO?
    
    var shopname : ShopNameVO?
    var shopitem : [ItemVO] = [ItemVO]()
    var bestitem : [BestVO] = [BestVO]()
    
    var pid = 0
    var segueTitle = ""
    var id = 0 //mid
    
    
    
    @IBAction func btnBookmark(_ sender: Any) {
        //bookmark
        let model = favoriteListModel(self)
        model.getBookmarked(mid: id)

    }
    
    func a(){
        let model = favoriteListModel(self)
        model.isBookmarked(mid: id)
        
        if book?.bookmarked == "1"{
            btnImg.image = #imageLiteral(resourceName: "navi_jjim")
        }else {
            btnImg.image = #imageLiteral(resourceName: "navi_not jjim")
        }
        
    }
    
    @IBAction func btnBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let model = ShopInfoModel(self)
        
        model.getShopInfo(mid: id)
        model.getItemList(mid: id)
        model.getShopBestList(mid: id)
        navigationController?.navigationBar.barTintColor = UIColor.white
        
    }
    
    func networkResult(resultData: Any, code: String) {
        if code == "market info Success"{
            shopname  = resultData as? ShopNameVO
        }
        
        if code == "itemlist Success"{
            shopitem = resultData as! [ItemVO]
        }
        
        if code == "bestList Success"{
            bestitem = resultData as![BestVO]
        }
        
        if code == "isBookmarked"{  //isBookmarked
            book = resultData as? BookmarkedVO
        }
        if code == "success"{   //getBookmark
            simpleAlert(title: "알림", msg: "관심매장 상태가 변경되었습니다.")
            a()
        }
        
        heartCollectionView.reloadData()
        titleLabel.text = shopname?.name

    }
    
    
    //coolectionView -> 매장아이템 가져오기
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shopitem.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "htBestCell", for: indexPath) as! BestListCell
            
            
            let arr = [cell.img1, cell.img2, cell.img3, cell.img4, cell.img5, cell.img6]
            
            var cnt =  bestitem.count
            
            if cnt > 6 {
                cnt = 6
            }
            
            for i in 0 ..< cnt {
                    if let url = URL(string: gsno(bestitem[i].pimg)){
                        arr[i]!.kf.setImage(with:url)
                        arr[i]!.contentMode = .scaleToFill
                }
                
            }
            
            return cell
        }
            
        else {
            let shopitemVO = shopitem[indexPath.row - 1]    //indexPath가 1부터 시작하니깐  ( -1 )
                     let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "htShopCell", for: indexPath) as! HeartShopCell
            
            if let url = URL(string: gsno(shopitemVO.image)){
                cell.htShopImg.kf.setImage(with: url)
                cell.htShopImg.contentMode = .scaleToFill
            }
            
            cell.htShopName.text =  shopitemVO.name
            
            if (shopitemVO.price)!.contains("대") {
                cell.htShopPrice.text = shopitemVO.price
            }
            else {
                cell.htShopPrice.text = (shopitemVO.price?.description)! + " 원"
            }
            
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            
        }
        else {
            id = shopitem[indexPath.row - 1].pid!
            segueTitle = titleLabel.text!
            
            self.performSegue(withIdentifier: "detailSegue", sender: nil)
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let sg = segue.destination as! HeartDetailVC
        sg.id = id
        sg.tit = segueTitle
//        sg.memMid = id
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row > 0 {
            return CGSize(width: 175, height: 215)
        } else {
            return CGSize(width: 374, height: 500)
        }
    }
    
    
    
}

