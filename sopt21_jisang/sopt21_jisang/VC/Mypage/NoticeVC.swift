//
//  NoticeVC.swift
//  sopt21_jisang
//
//  Created by leeyunkyung on 2018. 1. 3..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import UIKit

class NoticeVC: UIViewController,UITableViewDelegate, UITableViewDataSource, NetworkCallback {
    var noticeList : [NoticeVO] = [NoticeVO]()
    
    @IBOutlet weak var noticeTableView: UITableView!
    
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.white
        
        let model = noticeModel(self)
        model.getNoticeList()
        print("Notice did Load")
    }
    
    //table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("noticeList.count = " + noticeList.count.description)
        return noticeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let noticeVO = noticeList[indexPath.row]
        let noticeCell = tableView.dequeueReusableCell(withIdentifier: "noticeCell", for: indexPath) as! NoticeCell
        
        print("notice = " + gsno(noticeVO.title))
        
        noticeCell.noticeTitle.text = gsno(noticeVO.title)
        noticeCell.noticeDate.text = gsno(noticeVO.ndate)
        
        return noticeCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        //        print(noticeList.index(after: indexPath))
    }
    
    //networkResult
    
    func networkResult(resultData: Any, code: String) {
        if code == "noticeSuccess"{
            noticeList = resultData as! [NoticeVO]
            noticeTableView.reloadData()
            print("net1")
        }
        
        print("net2")
    }
    
    
}

