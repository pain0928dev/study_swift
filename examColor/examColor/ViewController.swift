//
//  ViewController.swift
//  examColor
//
//  Created by 402-24 on 01/12/2018.
//  Copyright © 2018 402-24. All rights reserved.
//

import UIKit

extension UIColor {
  
    class func uicolorFromHex(_ rgbValue: UInt32, alpha: CGFloat) -> UIColor
    {
        // UIColor 값의 범위는 0 ~ 1.0 이므로 255로 나누어 0 ~ 1 사이의 값으로 만들어 준다.
        let red = CGFloat( (rgbValue & 0xFF0000) >> 16)/255.0
        let green = CGFloat( (rgbValue & 0xFF00) >> 8)/255.0
        let blue = CGFloat( (rgbValue & 0xFF))/255.0
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    class func uicolorFormHex1(red:Int, green:Int, blue: Int, alpha: CGFloat) -> UIColor {
        let red = CGFloat(red)/255.0
        let blue = CGFloat(blue)/255.0
        let green = CGFloat(green)/255.0
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    class var myRed : UIColor {
        return UIColor(red: 0, green: 1, blue: 1, alpha: 1)
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        btn1.setTitle("빨간색", for: UIControl.State.normal)
        btn2.setTitle("노란색", for: UIControl.State.normal)
        btn3.setTitle("파랑색", for: UIControl.State.normal)
        btn4.setTitle("보라색", for: UIControl.State.normal)
        btn5.setTitle("흑색", for: UIControl.State.normal)

    }

    @IBAction func btn1(_ sender: UIButton) {
        lblName.textColor = UIColor.red
        view.backgroundColor = UIColor.myRed
    }
    @IBAction func btn2(_ sender: UIButton) {
        lblName.textColor = UIColor.yellow
        //view.backgroundColor = UIColor.yellow
        view.backgroundColor = UIColor.uicolorFromHex(0xf0f0f0, alpha: 1)
    }
    @IBAction func btn3(_ sender: UIButton) {
        lblName.textColor = UIColor.blue
        view.backgroundColor = UIColor.blue
    }
    @IBAction func btn4(_ sender: UIButton) {
        lblName.textColor = UIColor.purple
        view.backgroundColor = UIColor.purple
    }
    @IBAction func btn5(_ sender: UIButton) {
        lblName.textColor = UIColor.black
        view.backgroundColor = UIColor.black
    }
}



