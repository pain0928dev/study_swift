//
//  ViewController.swift
//  homework_01
//
//  Created by ljh0928 on 23/11/2018.
//  Copyright © 2018 ljh0928. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return numberOfComponent
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fileName.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fileName[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        imgShow.image = UIImage(named: fileName[row])
        imgIndex = row
    }

    

    @IBOutlet var imgShow: UIImageView!
    @IBOutlet var currentTime: UILabel!
    
    let numberOfComponent = 2
    let fileName = ["access_alarms.png", "add_alarm.png", "bluetooth.png", "bluetooth_connected.png", "bluetooth_disabled.png", "bluetooth_searching.png"]

    let timeFormat = "yyyy-MM-dd HH:mm"
    let interval  = 1.0
    var timer:Timer!
    var listImage = [UIImage]()
    var strCurrentTime: String!
    var strAlarmTime: String!
    var imgIndex = 0
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("viewDidLoad")
        
        // init
        strAlarmTime = String()
        
        
        //listImage = [UIImage]()
        
        /*
        var image = UIImage()
        for name in fileName {
            image = UIImage(named: name)!
            listImage.append(image)
        }
        */
        
        timer = Timer.scheduledTimer(withTimeInterval: interval,
                                     repeats: true) {
                                        timer in
                                        //Put the code that be called by the timer here.
                                        self.updateTime()
        }
                                        
    }

    @IBAction func btnPrev(_ sender: UIButton) {
        print("inx: \(imgIndex)")
        
        imgIndex -= 1
        if imgIndex <= fileName.startIndex {
            imgIndex = fileName.endIndex - 1
        }
        
        imgShow.image = UIImage(named: fileName[imgIndex])
    }
    
    @IBAction func btnNext(_ sender: UIButton) {
        print("inx: \(imgIndex)")
        
        imgIndex += 1
        if imgIndex >= fileName.endIndex {
            imgIndex = fileName.startIndex
        }
        imgShow.image = UIImage(named: fileName[imgIndex])
        
        
    }
    
    @IBAction func pickerDateTime(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        
        //print("Date: \(sender.date)")
        
        formatter.dateFormat = timeFormat
        strAlarmTime = formatter.string(from: datePickerView.date)
        print("Set:" + strAlarmTime)
    }
    
    func updateTime(){
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd EEE HH:mm:ss"
        currentTime.text = formatter.string(from: date as Date)
        
        // if set alarm, compare time
        if strAlarmTime.count > 1 {
            formatter.dateFormat = timeFormat
            strCurrentTime = formatter.string(from: date as Date)
            
            if strAlarmTime.contains(strCurrentTime) {
                print("set Alarm !!!!")
                view.backgroundColor = UIColor.red
            }
        }
        
    }
        
}

