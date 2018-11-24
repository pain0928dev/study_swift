//
//  ViewController.swift
//  examFile
//
//  Created by 402-23 on 24/11/2018.
//  Copyright © 2018 402-23. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
  
        if let asset = NSDataAsset(name: "Data") {
            let data = asset.data
            //let d = try? JSONSerialization.jsonObject(with: data, options: [])
            
            
            print(data.debugDescription)
            
            var dump = ""
            for d in data {
                
                dump += String(format: "%c", d)
                
            }
            print(dump)

        }
        
    }


}

