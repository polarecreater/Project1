//
//  BoardViewController.swift
//  Talkt it!
//
//  Created by SWUCOMPUTER on 14/04/2019.
//  Copyright © 2019 SWUCOMPUTER. All rights reserved.
//

import UIKit

class BoardViewController: UIViewController {

    @IBOutlet var OuterView01: UIView!
    @IBOutlet var LanguageLabel01: UILabel!
    @IBOutlet var WhenLabel01: UILabel!
    @IBOutlet var WhereLabel01: UILabel!
    @IBOutlet var InnerView01: UIView!
    var info1: String?
    var info2: String?
    var info3: String?
    var seem: Bool?
    var cantseem: Bool?
    var mynamename: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        OuterView01.isHidden = true
        InnerView01.isHidden = false
        
        //view 보이기 bool 받아옴
        if let contentBool = seem{
            OuterView01.isHidden = contentBool
        }
        if let contentBool = cantseem{
            InnerView01.isHidden = contentBool
        }
       
        //메세지 받아옴
        if let contentString = info1{
            LanguageLabel01.text = contentString
        }
        
        if let contentString = info2{
            WhenLabel01.text = contentString
        }
        
        if let contentString = info3{
            WhereLabel01.text = contentString
        }
        
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}

