//
//  BoardViewController.swift
//  Talkt it!
//
//  Created by SWUCOMPUTER on 13/04/2019.
//  Copyright © 2019 SWUCOMPUTER. All rights reserved.
//

import UIKit

class WriteViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet var display: UILabel!
    @IBOutlet var display2: UILabel!
    @IBOutlet var display3: UILabel!
    @IBOutlet var pickerDateTime: UIDatePicker!
    @IBOutlet var pickerWhere: UIPickerView!
    @IBOutlet var pickerLanguage: UIPickerView!
    
    @IBOutlet var activator: UIActivityIndicatorView!
    
    @IBOutlet var pickView01: UIView!
    @IBOutlet var pickView02: UIView!
    @IBOutlet var pickView03: UIView!
    @IBOutlet var slider: UISlider!
    
    @IBOutlet var whenFinishButton: UIButton!
    @IBOutlet var languageFinishButton: UIButton!
    @IBOutlet var whereFinishButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickView02.isHidden = true
        pickView03.isHidden = true
        activator.startAnimating()
    }
    
    let languageArray: Array<String> = ["Korean","English","French","Vietnamse","Japanese","Chinese"]
    let skillArray: [String] = ["good!","not good"]
    let roomArray: Array<String> = ["50주년기념관 글로벌라운지", "인문사회대 스터디룸", "도서관 세미나실"]
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        var retint: Int
        retint = 1
        if pickerView == pickerLanguage{
            retint = 2
        }else if pickerView == pickerWhere{
            retint = 1}
        return retint
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var retint: Int
        retint = 1
        if pickerView == pickerLanguage{
            if component == 0 { retint = languageArray.count}
            else {retint = skillArray.count}
        }
        else if pickerView == pickerWhere {
            if component == 0 { retint = roomArray.count}
        }
        return retint
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var retstr: String
        retstr = " "
        if pickerView == pickerLanguage{
            if component == 0 { retstr = languageArray[row]}
            else{ retstr = skillArray[row]}
        }
        else if pickerView == pickerWhere{
            if component == 0 { retstr = roomArray[row] }
        }
        return retstr
    }
    @IBAction func languageFinish(_ sender: UIButton) {
       
        let language: String! = languageArray[self.pickerLanguage.selectedRow(inComponent: 0)]
        let skill: String! = skillArray[self.pickerLanguage.selectedRow(inComponent: 1)]
        
        var outString: String = "나의 "
        outString += language
        outString += " "
        outString += skill
        
        display.text = outString
        
        pickView01.isHidden = true
        slider.value = 1
        pickView02.isHidden = false
    }
    
    @IBAction func whenFinish(_ sender: UIButton) {
        let dateFormatter = DateFormatter()
        // .none, .short, .medium, .long, .full
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .medium
        display2.text = dateFormatter.string(from: pickerDateTime.date) + "에"
        
        pickView02.isHidden = true
        slider.value = 2
        pickView03.isHidden = false
        
    }
    @IBAction func whereFinish(_ sender: UIButton) {
        let room: String! = roomArray[self.pickerWhere.selectedRow(inComponent: 0)]
        display3.text = room + "에서 만나자"
        slider.value = 3
        activator.stopAnimating()
    }
    @IBAction func sliderMove(_ sender: UISlider) {
        if sender.value < 1{
            pickView01.isHidden = false
            pickView02.isHidden = true
            pickView03.isHidden = true
        }
        else if sender.value < 2{
            pickView01.isHidden = true
            pickView02.isHidden = false
            pickView03.isHidden = true
        }
        else if sender.value < 3{
            pickView01.isHidden = true
            pickView02.isHidden = true
            pickView03.isHidden = false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toBoardView" {
            let destVC = segue.destination as! BoardViewController
            //destVC.title = "Talkt it 게시판(Board)"
            var send: [String!] = [display.text, display2.text, display3.text]
            //언어 보내기
            destVC.info1 = send[0]
            
            //날짜 보내기
            destVC.info2 = send[1]
           
            //장소 보내기
            destVC.info3 = send[2]
            
            //view 보이는 bool 보내기
            destVC.seem = false
            destVC.cantseem = true
        }
    }
    

}
