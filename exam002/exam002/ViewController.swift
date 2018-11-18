//
//  ViewController.swift
//  exam002
//
//  Created by 402-23 on 2018. 11. 17..
//  Copyright © 2018년 402-23. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgLamp: UIImageView!
    @IBOutlet weak var btnUpDown: UIButton!
    
    var isZoom = false
    var imgOn: UIImage?
    var imgOff: UIImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imgOn = UIImage(named: "lamp_on")
        imgOff = UIImage(named: "lamp_off")
        
        imgLamp.image = imgOff
    }

    @IBAction func swOnOff(_ sender: UISwitch) {
        
        if sender.isOn {
            imgLamp.image = imgOn
        }
        else {
            imgLamp.image = imgOff
        }
    }
 
    @IBAction func btnUpDown(_ sender: UIButton) {
        
        let scale:CGFloat = 2
        var newWidth: CGFloat, newHeight: CGFloat

        #if false
        if sender.isSelected {
            sender.isSelected = false
            btnUpDown.setTitle("축소", for: UIControl.State.normal)
        }
        else {
            sender.isSelected = true
           btnUpDown.setTitle("확대", for: UIControl.State.normal)
        }
        #endif
        
        if isZoom {
            
            newWidth = imgLamp.frame.width/scale
            newHeight = imgLamp.frame.height/scale
            imgLamp.frame.size = CGSize(width: newWidth, height: newHeight)
            isZoom = false
            btnUpDown.setTitle("축소", for: UIControl.State.normal)
        }
        else {
            newWidth = imgLamp.frame.width*scale
            newHeight = imgLamp.frame.height*scale
            imgLamp.frame.size = CGSize(width: newWidth, height: newHeight)
            isZoom = true
            btnUpDown.setTitle("확대", for: UIControl.State.normal)
        }
    }
    
    

}

