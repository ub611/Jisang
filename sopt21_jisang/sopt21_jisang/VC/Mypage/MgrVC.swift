//
//  MgrVC.swift
//  sopt21_jisang
//
//  Created by leeyunkyung on 2018. 1. 4..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import UIKit

class MgrVC: UIViewController, UIImagePickerControllerDelegate,  UINavigationControllerDelegate,NetworkCallback{
    @IBOutlet weak var shopImg: UIImageView!
    var marketImg = [ShopImgVO]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.barTintColor = UIColor.white
        shopImg.layer.cornerRadius = (shopImg.frame.size.width ) / 2
        shopImg.layer.masksToBounds = true
        
        let model = ShopImgModel(self)
        model.getShopImg(mid: 23)
        print("mgrvc success")
        
        
        
        
    }
    /*func networkResult(resultData: Any, code: String) {
        if(code == "success") {
            if let list = resultData as? [ShopListVO] {
                print("1",list)
                
            }
            print("2", resultData)
            let url = URL(string: resultData as! String)
            shopImg.kf.setImage(with: url)
            
        }
        
    }*/
    func networkResult(resultData: Any, code: String) {
        if code == "Successful Get img Data"{
            if let list = resultData as? [ShopImgVO]{
                print("1", list)
            }
            print("2", resultData)
            let url = URL(string: resultData as! String)
            shopImg.kf.setImage(with: url)
        }
    }
    
    @IBAction func btn_cam(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let alert = UIAlertController(title: "사진소스를 선택해주세요", message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title:"카메라", style: .default, handler: { (action:UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated:  true, completion:  nil)
            }else{
                print("Camera not available")
            }
        }))
        alert.addAction(UIAlertAction(title: "사진앨범", style: .default, handler:{(action:UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary; self.present(imagePickerController, animated:  true, completion:  nil)
        }))
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("사용자가 취소함")
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        shopImg.image = image
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func btn_plus(_ sender: Any) {
        simpleAlert(title: "알림", msg: "서비스 준비중입니다.")
    }
    
    @IBAction func btn_regist(_ sender: Any) {
        simpleAlert(title: "알림", msg: "서비스 준비중입니다.")
    }
    
}
