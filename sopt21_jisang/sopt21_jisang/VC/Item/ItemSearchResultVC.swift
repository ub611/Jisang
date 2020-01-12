//
//  ItemSearchResultVC.swift
//  sopt21_jisang
//
//  Created by ubin Kim on 2018. 1. 10..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import UIKit

class ItemSearchResultVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, NetworkCallback {
    
    @IBOutlet weak var collectview: UICollectionView!
    let data = UserDefaults.standard
    var keyword: [Keyword] = [Keyword]()
    
    func networkResult(resultData: Any, code: String) {
        if code == "hashed" {
            keyword = resultData as! [Keyword]
            print("*******")
        }
        else if code == "no products" {
            simpleAlert(title: "알림", msg: "상품이 없습니다.")
        }
        collectview.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.white
        
        //collectview.delegate = self
        //collectview.dataSource = self
        
        //let model = SearchModel(self)
        //model.getKeywordList(hashname: data.string(forKey: "hashname")!)
        //collectview.reloadData()
    }

    override func viewWillAppear(_ animated: Bool) {
//        collectview.delegate = self
//        collectview.dataSource = self
//
        let model = SearchModel(self)
        model.getKeywordList(hashname: data.string(forKey: "hashname")!)
        
        collectview.reloadData()
        
      
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("=====================")
        print(keyword.count)

        return keyword.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "locItemCell", for: indexPath) as! LocationItemCollectionCell
        
        let vo : Keyword = keyword[indexPath.row]
        
        data.set(vo.productid, forKey: "productid")
        
        print(vo.price! + "__")
        cell.locItemCollPrice.text = vo.price
        cell.locItemCollName.text = vo.name
        cell.locShopName.text = vo.marketname
        
        if let url = URL(string: gsno(vo.productimg)){
            cell.locItemCollImg.kf.setImage(with: url)
            cell.locItemCollImg.contentMode = .scaleToFill
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: "UICollectionElementKindSectionHeader", withReuseIdentifier: "SectionHeader", for: indexPath)
            as! SearchResultHeaderCell
        
        header.keywordLabel.text = data.string(forKey: "hashname")
        
        return header
    }
    
    @IBAction func btn_back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

