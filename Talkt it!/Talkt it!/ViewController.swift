//
//  ViewController.swift
//  Talkt it!
//
//  Created by SWUCOMPUTER on 05/04/2019.
//  Copyright © 2019 SWUCOMPUTER. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet var studentsegment: UISegmentedControl!
    @IBOutlet var talktitView: UIView!
    @IBOutlet var talktitLabel: UILabel!
    @IBOutlet var languageLabel: UILabel!
    @IBOutlet var segToButton: UIButton!
    @IBOutlet var subSegView: UIView!
    @IBOutlet var nameText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        subSegView.isHidden = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //delegate method
        textField.resignFirstResponder()
        return true }
    
    @IBAction func changeLanguage(_ sender: UISwitch) {
        //랭귀지라벨을 한글로 바꿔주기+색 바꾸기
        if sender.isOn{
            languageLabel.text = "교환학생과 언어교환을 해봐요!"
            talktitView.backgroundColor = UIColor.cyan
        }
        else{
            languageLabel.text = "Language Exchange at your university!!"
            talktitView.backgroundColor = UIColor.magenta
        }
    }
    
    @IBAction func studentSelection(_ sender: UISegmentedControl) {
        //텍스트필드 입력값으로 talkt it 라벨 바꾸기
        talktitLabel.text = nameText.text! + " 's Talkt it!"
        
        subSegView.isHidden = false
        if sender.selectedSegmentIndex == 1{
            segToButton.titleLabel?.text = "Let's start!"}
        else {
            segToButton.titleLabel?.text = "시작해볼까요?"
        }
    }
}

