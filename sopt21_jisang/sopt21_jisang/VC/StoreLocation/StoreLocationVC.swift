//
//  StoreLocationVC.swift
//  sopt21_jisang
//
//  Created by leeyunkyung on 2018. 1. 4..
//  Copyright © 2018년 leeyunkyung. All rights reserved.
//

import UIKit

class StoreLocationVC: UIViewController, UIScrollViewDelegate, UIPopoverPresentationControllerDelegate  {
    @IBOutlet weak var containView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var map: UIImageView!
    @IBOutlet weak var grayView: UIView!
    
    @IBOutlet weak var gps: UIButton!
    @IBOutlet weak var pin: UIButton!
    
    var gps_flag = 0
    var pin_flag = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.white
        scrollView.delegate = self
        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 6.0
        grayView.isHidden = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.containView
    }
    
    
    
    //gps버튼
    @IBAction func btn_gps(_ sender: Any) {
        if gps_flag == 0 {
            gps.setImage(#imageLiteral(resourceName: "location_click") , for: .normal)
            gps_flag = 1
            
        }else{
            print("gps flag=" + gps_flag.description)
            gps.setImage( #imageLiteral(resourceName: "location_unclick"), for: .normal)
            gps_flag = 0
        }
    }
    
    
    //핀
    @IBAction func btn_pin(_ sender: Any) {
        if pin_flag == 0 {
            pin.setImage( #imageLiteral(resourceName: "pin_click"), for: .normal)
            pin_flag = 1
        }else{
            pin.setImage( #imageLiteral(resourceName: "pin_unclick"), for: .normal)
            pin_flag = 0
        }
    }
    
    //btn_map1.2.3는 알람창 만들기
    //    @IBAction func btn_map1(_ sender: Any) {
    //        print("부평")
    //        mapMagic()
    //    }
    //    @IBAction func btn_map2(_ sender: Any) {
    //        print("고속터미널")
    //        mapMagic()
    //    }
    //
    //    @IBAction func btn_map3(_ sender: Any) {
    //        print("잠실")
    //        mapMagic()
    //    }
    //
    //    @IBAction func btn_map4(_ sender: Any) {
    //        print("강남")
    //        mapMagic()
    //    }
    //
    //    @IBAction func tap(_ sender: Any) {
    //        mapMagic()
    //    }
    
    //지도
    //    @IBAction func btn_map(_ sender: Any) {
    //        print("btn_map")
    ////        grayView.isHidden = false
    ////        map_click.isHidden = false
    //        map1.isHidden = false
    //        map2.isHidden = false
    //        map3.isHidden = false
    //        map4.isHidden = false
    //    }
    //
    //    func mapMagic(){
    ////        grayView.isHidden = true
    ////        map_click.isHidden = true
    //        map1.isHidden = true
    //        map2.isHidden = true
    //        map3.isHidden = true
    //        map4.isHidden = true
    //    }
    //
    //
    /**************투명버튼 시작***************/
    @IBOutlet weak var btn_a13: UIButton!
    @IBOutlet weak var btn_a14: UIButton!
    @IBOutlet weak var btn_south1: UIButton!
    @IBOutlet weak var btn_south4: UIButton!
    @IBOutlet weak var btn_south5: UIButton!
    @IBOutlet weak var btn_d12: UIButton!
    @IBOutlet weak var btn_d13: UIButton!
    @IBOutlet weak var btn_d19: UIButton!
    @IBOutlet weak var btn_north1: UIButton!
    @IBOutlet weak var btn_north2: UIButton!
    @IBOutlet weak var btn_north6: UIButton!
    @IBOutlet weak var btn_north8: UIButton!
    var flag2:Int = 0
    
    //popover
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pop" {
            let dest = segue.destination
            if let pop = dest.popoverPresentationController{
                pop.delegate = self
            }
            
            
        }
        
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    //A-13
    var mflag = -1
    
    @IBAction func A13(_ sender: UIButton) {
        print("A13")
        
        print("pin = " + pin_flag.description + "m flag = " + mflag.description)
        
        
        if(pin_flag == 1){//핀 버튼이 눌렸을때
            if mflag == 1 {
                btn_a13.setImage(#imageLiteral(resourceName: "2020.png"), for: .normal)
                mflag = 0
            }
                
            else {
                mflag = 1
                btn_a13.setImage( #imageLiteral(resourceName: "map_pick"), for: .normal)
                self.performSegue(withIdentifier: "pop", sender: self)
                
            }
            
            
        }else{//아니면 투명버튼에 핀 꽂히면안됨
            print("no click pinBtn")
        }
        
    }
    
    //A-14
    @IBAction func A14(_ sender: Any) {
        print("A14")
        if(pin_flag == 1){//핀 버튼이 눌렸을때
            btn_a14.setImage( #imageLiteral(resourceName: "map_pick"), for: .normal)
        }else{//아니면 투명버튼에 핀 꽂히면안됨
            print("no click pinBtn")
        }
    }
    
    //south1
    @IBAction func south1(_ sender: Any) {
        print("south1")
        if(pin_flag == 1){//핀 버튼이 눌렸을때
            btn_south1.setImage( #imageLiteral(resourceName: "map_pick"), for: .normal)
        }else{//아니면 투명버튼에 핀 꽂히면안됨
            print("no click pinBtn")
        }
    }
    
    //south4
    @IBAction func south4(_ sender: Any) {
        print("south4")
        if(pin_flag == 1){//핀 버튼이 눌렸을때
            btn_south4.setImage( #imageLiteral(resourceName: "map_pick"), for: .normal)
        }else{//아니면 투명버튼에 핀 꽂히면안됨
            print("no click pinBtn")
        }
    }
    
    //south5
    @IBAction func south5(_ sender: Any) {
        print("south5")
        if(pin_flag == 1){//핀 버튼이 눌렸을때
            btn_south5.setImage( #imageLiteral(resourceName: "map_pick"), for: .normal)
        }else{//아니면 투명버튼에 핀 꽂히면안됨
            print("no click pinBtn")
        }
    }
    
    //D-12
    @IBAction func D12(_ sender: Any) {
        print("D12")
        if(pin_flag == 1){//핀 버튼이 눌렸을때
            btn_d12.setImage( #imageLiteral(resourceName: "map_pick"), for: .normal)
        }else{//아니면 투명버튼에 핀 꽂히면안됨
            print("no click pinBtn")
        }
    }
    
    //D-13
    @IBAction func D13(_ sender: Any) {
        print("D13")
        if(pin_flag == 1){//핀 버튼이 눌렸을때
            btn_d13.setImage( #imageLiteral(resourceName: "map_pick"), for: .normal)
        }else{//아니면 투명버튼에 핀 꽂히면안됨
            print("no click pinBtn")
        }
    }
    
    //D-19
    @IBAction func D19(_ sender: Any) {
        print("D19")
        if(pin_flag == 1){//핀 버튼이 눌렸을때
            btn_d19.setImage( #imageLiteral(resourceName: "map_pick"), for: .normal)
        }else{//아니면 투명버튼에 핀 꽂히면안됨
            print("no click pinBtn")
        }
    }
    
    //north1
    @IBAction func north1(_ sender: Any) {
        print("north1")
        if(pin_flag == 1){//핀 버튼이 눌렸을때
            btn_north1.setImage( #imageLiteral(resourceName: "map_pick"), for: .normal)
        }else{//아니면 투명버튼에 핀 꽂히면안됨
            print("no click pinBtn")
        }
    }
    
    //north2
    @IBAction func north2(_ sender: Any) {
        print("north2")
        if(pin_flag == 1){//핀 버튼이 눌렸을때
            btn_north2.setImage( #imageLiteral(resourceName: "map_pick"), for: .normal)
        }else{//아니면 투명버튼에 핀 꽂히면안됨
            print("no click pinBtn")
        }
    }
    
    //north6
    @IBAction func north6(_ sender: Any) {
        print("north6")
        if(pin_flag == 1){//핀 버튼이 눌렸을때
            btn_north6.setImage( #imageLiteral(resourceName: "map_pick"), for: .normal)
        }else{//아니면 투명버튼에 핀 꽂히면안됨
            print("no click pinBtn")
        }
    }
    
    //north8
    @IBAction func north8(_ sender: Any) {
        print("north8")
        if(pin_flag == 1){//핀 버튼이 눌렸을때
            btn_north8.setImage( #imageLiteral(resourceName: "map_pick"), for: .normal)
        }else{//아니면 투명버튼에 핀 꽂히면안됨
            print("no click pinBtn")
        }
    }
    /**************투명버튼 끝****************/
    
    
    
}

