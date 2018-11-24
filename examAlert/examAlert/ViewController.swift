//
//  ViewController.swift
//  examAlert
//
//  Created by 402-24 on 24/11/2018.
//  Copyright © 2018 402-24. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var imgDisplay: UIImageView!
    
    var lampOn: UIImage?
    var lampOff: UIImage?
    var lampRemove: UIImage?
    
    var isLamp: Bool!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        isLamp = false
    
        lampOn = UIImage(named: "lamp-on")
        lampOff = UIImage(named: "lamp-off")
        lampRemove = UIImage(named: "lamp-remove")
        
        imgDisplay.image = lampOff
    }

    func checkLamp(_ on_off: Bool){
        
        if on_off == true {
        let lampAlert = UIAlertController(title: "경고", message: "현재 상태 on 입니다.", preferredStyle: UIAlertController.Style.alert)
        
        let onAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
        lampAlert.addAction(onAction)
    
        present(lampAlert, animated: true, completion: nil)
        }
        else if on_off == false {
            let lampAlert = UIAlertController(title: "경고", message: "현재 상태 off 입니다.", preferredStyle: UIAlertController.Style.alert)
            
            var onAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default, handler: {
                ACTION in self.imgDisplay.image = self.lampOff
            })
            lampAlert.addAction(onAction)
            
            onAction = UIAlertAction(title: "아니요", style: UIAlertAction.Style.default, handler: nil)
            lampAlert.addAction(onAction)
            
            present(lampAlert, animated: true, completion: nil)
            
            
            onAction = UIAlertAction(title: <#T##String?#>, style: <#T##UIAlertAction.Style#>, handler: <#T##((UIAlertAction) -> Void)?##((UIAlertAction) -> Void)?##(UIAlertAction) -> Void#>)
        }
    }

    @IBAction func btnOn(_ sender: UIButton) {
        
        checkLamp(true)
        imgDisplay.image = lampOn
    }
    @IBAction func btnOff(_ sender: UIButton) {
        checkLamp(false)
        imgDisplay.image = lampOff
    }
    @IBAction func btnRemove(_ sender: UIButton) {
        imgDisplay.image = lampRemove
    }
}

