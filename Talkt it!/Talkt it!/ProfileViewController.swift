//
//  ProfileViewController.swift
//  Talkt it!
//
//  Created by SWUCOMPUTER on 13/04/2019.
//  Copyright © 2019 SWUCOMPUTER. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        indicator.startAnimating()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet var indicator: UIActivityIndicatorView!
    @IBOutlet var progressBar: UIProgressView!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //delegate method
        textField.resignFirstResponder()
        return true }
    @IBAction func textToProgress(_ sender: UITextField) {
        if sender.clearsOnBeginEditing
        {progressBar.progress += 0.04}
    }
    @IBAction func progressToIndicator(){
        if progressBar.progress == 1.0{
            indicator.stopAnimating()
        }
    }
}
