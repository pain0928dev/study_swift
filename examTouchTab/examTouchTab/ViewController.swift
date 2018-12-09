//
//  ViewController.swift
//  examTouchTab
//
//  Created by 402-24 on 09/12/2018.
//  Copyright © 2018 402-24. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var lblTabCount: UILabel!
    @IBOutlet weak var lblTouchCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        lblMessage.text = ""
        lblTabCount.text = ""
        lblTouchCount.text = ""
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touch Began")
        
        let touch = touches.first! as UITouch
        lblMessage.text = "Touches Began"
        lblTabCount.text = String(touch.tapCount)
        lblTouchCount.text = String(touches.count)
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touch Moved")
        
        let touch = touches.first! as UITouch
        lblMessage.text = "Touches Moved"
        lblTabCount.text = String(touch.tapCount)
        lblTouchCount.text = String(touches.count)
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touch Ended")
        
        let touch = touches.first! as UITouch
        lblMessage.text = "Touches Ended"
        lblTabCount.text = String(touch.tapCount)
        lblTouchCount.text = String(touches.count)
    }

}

