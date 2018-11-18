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
        return self.imgFileName.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        print("name: \(self.imgFileName[row])")
        return self.imgFileName[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("didSelectRow: \(row)")
        self.lblShowFileName.text = self.imgFileName[row]
        self.showImage.image = UIImage(named: self.imgFileName[row])
    }
    
    @IBOutlet weak var pickerSelectFile: UIPickerView!
    @IBOutlet weak var lblShowFileName: UILabel!
    @IBOutlet weak var showImage: UIImageView!
    
    var imgFileName:[String] = ["2.jpg", "3.jpg", "4.jpg", "5.jpg"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pickerSelectFile.delegate = self
        
        loadFileName()

    }
   

    /*
    func loadFileName() -> [String]? {
        let docsDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let fileManager = FileManager.default
        do {
            let files = try fileManager.contentsOfDirectory(atPath: docsDir)
            let audioFiles = files.filter( { (name: String) -> Bool in
                return name.hasSuffix("jpg")
            })
            return audioFiles
        } catch {
            return nil
        }
    }
    */
    func loadFileName(){
      guard let documentsDirs = FileManager.default.urls(for: .applicationDirectory, in: .userDomainMask).first
        else{
            return
        }
        
        
        print("Dirs = \(documentsDirs)")
        
        let fileManager = FileManager.default
        do {
            let files = try fileManager.contentsOfDirectory(atPath: documentsDirs.absoluteString)
            
            for file in files {
                print("find: \(file.description)")
            }
            
        } catch let err as NSError{
            print("Error!!!")
        }
    }
    
    
    
    
    }




