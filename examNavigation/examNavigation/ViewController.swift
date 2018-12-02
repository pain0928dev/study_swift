//
//  ViewController.swift
//  examNavigation
//
//  Created by 402-24 on 01/12/2018.
//  Copyright © 2018 402-24. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btnEdit2(_ sender: UIButton) {
        print("btnEdit2")
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        print("Id :: " + segue.identifier!)
        
        let editViewController = segue.destination as! EditViewController
        
        if segue.identifier == "seg_edit1" {
            
        }
        else if segue.identifier == "seg_edit2"{
            
        }
    }
}

