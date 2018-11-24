//
//  ViewController.swift
//  DatePicker
//
//  Created by 402-23 on 2018. 11. 18..
//  Copyright © 2018년 402-23. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateTimePicker: UIDatePicker!
    @IBOutlet weak var timeNow: UILabel!
    @IBOutlet weak var TimePick: UILabel!

    //let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var timer:Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
   
        //Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        
        timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) {
                                        timer in
                                        //Put the code that be called by the timer here.
                                        self.updateTime()
        }
        
        
     }

    func updateTime(){
       let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        timeNow.text = "Now: " + formatter.string(from: date as Date)
  
    }
    
    @IBAction func valueChangedTimeDate(_ sender: UIDatePicker) {
        
        let datePickerView = sender
        let formatter = DateFormatter()
        
        //print("Date: \(sender.date)")
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        TimePick.text = "선택시간:" + formatter.string(from: datePickerView.date)
    }
    
}

