//
//  HeartVC.swift
//  sopt21_jisang
//
//  Created by leeyunkyung on 2018. 1. 1..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import UIKit
import Kingfisher

class HeartVC: UIViewController,UITableViewDelegate, UITableViewDataSource, NetworkCallback {
    var favorite : [FavoriteVO] = [FavoriteVO]()
  
    var mid = 0
    
    @IBOutlet weak var likeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        likeTableView.delegate = self
        likeTableView.reloadData()
        self.likeTableView.rowHeight = 94
          navigationController?.navigationBar.barTintColor = UIColor.white        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        let model = favoriteListModel(self)
        
        //print("uID" + uID.description)
        if UserDefaults.standard.string(forKey: "token") == nil {
            simpleAlert(title: "알림", msg: "로그인 후 이용해주세요.")
        }
        else {
            model.getFavoriteList()
        }
            
        
    }
    
    func networkResult(resultData: Any, code: String) {
        if code == "favoriteList Success"{
            favorite = resultData as! [FavoriteVO]
        }
        if code == "success"{
            simpleAlert(title: "알림", msg: "관심매장이 해제되었습니다.")
        }
        likeTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(favorite.count.description + " favorite Count")
        return favorite.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let favoriteVO = favorite[indexPath.row]
        let heartTableCell = tableView.dequeueReusableCell(withIdentifier: "heartCell", for: indexPath) as! HeartCell
        
        if let url = URL(string: gsno(favoriteVO.mimage)){
            heartTableCell.heartImage.kf.setImage(with: url)
            heartTableCell.heartImage.contentMode = .scaleToFill
        }
        
        //heartTableCell.heartImage.kf.setImage(with: URL(string: favoriteVO.mimage!))//kingfisher
        heartTableCell.heartShopName.text = favoriteVO.mname
        
        var locText = ""
        
        if favoriteVO.location! == "201" {
            locText = "강남 "
        }else {
            locText = "고속 터미널 "
        }
        
        heartTableCell.heartPlace.text = locText + "지하상가"
        
        heartTableCell.heartImage.layer.cornerRadius = (heartTableCell.heartImage.frame.size.width) / 2
        heartTableCell.heartImage.layer.masksToBounds = true
        
        return heartTableCell
    }
    @IBAction func btnDelete(_ sender: Any) {
       
        likeTableView.reloadData()

    }
    
    var ind : Int?
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let vo = favorite[indexPath.ro]
        mid = favorite[indexPath.row].mid!
        ind = indexPath.row
        if mid != 0 {
            self.performSegue(withIdentifier: "heartDetailSeague", sender: nil)
        }
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let locationSegue = segue.destination as! HeartDetailShopVC
        locationSegue.id = mid
        
    }
    
}

