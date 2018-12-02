//
//  ViewController.swift
//  examMugicPlayer
//
//  Created by 402-24 on 02/12/2018.
//  Copyright © 2018 402-24. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate, AVAudioRecorderDelegate {

    @IBOutlet weak var pbTime: UIProgressView!
    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblEndTime: UILabel!
    @IBOutlet weak var slVolume: UISlider!
    @IBOutlet weak var swOnOff: UISwitch!
    
    let MAX_VOLUME = 1
    
    var audioPlayer: AVAudioPlayer!
    var audioRecorder: AVAudioRecorder!
    var audioFile: URL!
    var timer:Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pbTime.progress = Float(0)
        slVolume.maximumValue = Float(MAX_VOLUME)
        slVolume.value = 0
        
        swOnOff.isOn = false
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {
           _ in self.updateTime()
        })
        

        initPlayer()
        initRecorder()
    }

    func initPlayer(){
        
        do{
            audioFile = Bundle.main.url(forResource: "Sicilian_Breeze", withExtension: "mp3")
            
            audioPlayer = try AVAudioPlayer(contentsOf: audioFile)
            audioPlayer.delegate = self
            audioPlayer.prepareToPlay()
            audioPlayer.volume = slVolume.value
            
            lblCurrentTime.text = convertNSTimeinterval2String(audioPlayer.currentTime)
            lblEndTime.text = convertNSTimeinterval2String(audioPlayer.duration)
            
        }catch let error as NSError{
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func initRecorder(){

        do{
        var documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        let recordfile = documentDirectory.appendingPathComponent("recordFile.m4a")
        
        let recordSettings = [AVFormatIDKey: NSNumber(value: kAudioFormatAppleLossless), AVEncoderAudioQualityKey: AVAudioQuality.max.rawValue, AVEncoderBitRateKey: 320000, AVNumberOfChannelsKey: 2, AVSampleRateKey: 44100.0] as [String:Any]
        
        audioRecorder = try AVAudioRecorder(url: recordfile, settings: recordSettings)
        audioRecorder.delegate = self
        }catch let error as NSError {
            print("Error: \(error)")
        }
        
    }

    func playRecorder(){
        let session = AVAudioSession.sharedInstance()
        do{
            try session.setCategory(AVAudioSession.Category.ambient, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)
        }catch let error as NSError {
            print("Error: \(error)")
        }
        
        do{
            try session.setActive(true, options: AVAudioSession.SetActiveOptions.init(rawValue: 0))
        }catch let error as NSError {
            print("Error: \(error)")
        }
    }
    
    func updateTime(){
        print("\(#function)")
        
        pbTime.progress = Float(audioPlayer.currentTime / audioPlayer.duration)
        lblCurrentTime.text = convertNSTimeinterval2String(audioPlayer.currentTime)
 
    }
    
    func convertNSTimeinterval2String(_ time: TimeInterval) -> String {
        let min = Int(time/60)
        let sec = Int(time.truncatingRemainder(dividingBy: 60))
        let strTime = String(format: "%02d:%02d", min, sec)
        return strTime
    }

    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print("didFinishPlaying")
        timer.invalidate()
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        print("audioRecorderDidFinishRecording")
    }
    
    @IBAction func touchUpPlay(_ sender: UIButton){
        audioPlayer.play()
    }
    @IBAction func touchUpBtnStop(_ sender: UIButton) {
        audioPlayer.stop()
    }
    @IBAction func touchUpBtnPause(_ sender: UIButton) {
        audioPlayer.pause()
    }
    @IBAction func valueChangedSlider(_ sender: UISlider) {
        
        print("Volume: \(sender.value)")
        
        audioPlayer.volume = sender.value
    }
}

