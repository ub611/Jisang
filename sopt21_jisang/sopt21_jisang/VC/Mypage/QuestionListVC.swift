//
//  QuestionListVC.swift
//  sopt21_jisang
//
//  Created by leeyunkyung on 2018. 1. 3..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//


import UIKit
import Kingfisher

class QuestionListVC: UIViewController, UITableViewDelegate, UITableViewDataSource, NetworkCallback {
    var question : [QuestionVO] = [QuestionVO]()
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("QuestionList")
        tableview.delegate = self
        navigationController?.navigationBar.barTintColor = UIColor.white
    }
    override func viewWillAppear(_ animated: Bool) {
        let model = questionModel(self)
        model.gequestionList()
    }

    
    func networkResult(resultData: Any, code: String) {
        if code == "questionList Success"{
            question = resultData as! [QuestionVO]
            tableview.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return question.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let questionVO = question[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "questionListCell", for: indexPath) as! QuestionListCell
        
        if let url = URL(string: gsno(questionVO.mimage)){
            cell.questionListImg.kf.setImage(with: url)
            cell.questionListImg.contentMode = .scaleToFill
        }
        
        cell.questionListDate.text = questionVO.qdate
        cell.questionListTitle.text = questionVO.mname
        cell.questionListContent.text = questionVO.content
        
        cell.questionListImg.layer.cornerRadius = (cell.questionListImg.frame.size.width) / 2
        cell.questionListImg.layer.masksToBounds = true
        
        return cell
    }
    
}

