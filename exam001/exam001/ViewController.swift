//
//  ViewController.swift
//  exam001
//
//  Created by 402-23 on 2018. 11. 17..
//  Copyright © 2018년 402-23. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelShow: UILabel!
    @IBOutlet weak var inputText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func touchUpSendButton(_ sender: UIButton) {
        
        labelShow.text = "My name is " + inputText.text!
    }
}

