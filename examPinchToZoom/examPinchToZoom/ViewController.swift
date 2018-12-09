//
//  ViewController.swift
//  examPinchToZoom
//
//  Created by 402-24 on 09/12/2018.
//  Copyright © 2018 402-24. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtPinch: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    var initFontSize: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initFontSize = CGFloat(bitPattern: 10)
        imgView.image = UIImage(named: "img-06")
        //let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinchText(_:)))
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinchImage(_:)))
        
        
        self.view.addGestureRecognizer(pinch)
    }
    
    @objc func doPinchText(_ pinch: UIPinchGestureRecognizer){
        if pinch.state == UIPinchGestureRecognizer.State.began {
            initFontSize = txtPinch.font.pointSize
        } else {
            txtPinch.font = txtPinch.font.withSize(initFontSize * pinch.scale)
        }
    }
    
    @objc func doPinchImage(_ pinch: UIPinchGestureRecognizer){
        imgView.transform = imgView.transform.scaledBy(x: pinch.scale, y: pinch.scale)
        pinch.scale = 1
    }


}

