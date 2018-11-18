//
//  ViewController.swift
//  PickerView
//
//  Created by 402-23 on 18/11/2018.
//  Copyright © 2018 402-23. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.imgArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        print("name: \(self.imgArray[row])")
        return self.imgArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("didSelectRow: \(row)")
        self.lblShowFileName.text = self.imgArray[row]
        self.showImage.image = UIImage(named: self.imgArray[row])
    }
    
    @IBOutlet weak var pickerSelectFile: UIPickerView!
    @IBOutlet weak var lblShowFileName: UILabel!
    @IBOutlet weak var showImage: UIImageView!
    
    var imgArray:[String] = ["2.jpg", "3.jpg", "4.jpg", "5.jpg"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pickerSelectFile.delegate = self
    }
   

    


}

