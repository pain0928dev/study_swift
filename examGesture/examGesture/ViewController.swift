//
//  ViewController.swift
//  examGesture
//
//  Created by 402-24 on 09/12/2018.
//  Copyright © 2018 402-24. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var imgUp: UIImageView!
    @IBOutlet weak var imgLeft: UIImageView!
    @IBOutlet weak var imgDown: UIImageView!
    @IBOutlet weak var imgRight: UIImageView!
    
    var upImgList: [UIImage]!
    var downImgList: [UIImage]!
    var rightImgList: [UIImage]!
    var leftImgList: [UIImage]!
    
    var numOfTouch = 2

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        upImgList = [UIImage]()
        downImgList = [UIImage]()
        rightImgList = [UIImage]()
        leftImgList = [UIImage]()
        
        upImgList.append(UIImage(named: "arrow-up-black")!)
        upImgList.append(UIImage(named: "arrow-up-green")!)
        upImgList.append(UIImage(named: "arrow-up-red")!)
        
        downImgList.append(UIImage(named: "arrow-down-black")!)
        downImgList.append(UIImage(named: "arrow-down-green")!)
        downImgList.append(UIImage(named: "arrow-down-red")!)
        
        rightImgList.append(UIImage(named: "arrow-right-black")!)
        rightImgList.append(UIImage(named: "arrow-right-green")!)
        rightImgList.append(UIImage(named: "arrow-right-red")!)
        
        leftImgList.append(UIImage(named: "arrow-left-black")!)
        leftImgList.append(UIImage(named: "arrow-left-green")!)
        leftImgList.append(UIImage(named: "arrow-left-red")!)
        
        imgUp.image = upImgList[0]
        imgDown.image = downImgList[0]
        imgRight.image = rightImgList[0]
        imgLeft.image = leftImgList[0]
        
        singleGesture()
        multiGesture()

        
    }
    
    func singleGesture(){
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        self.view.addGestureRecognizer(swipeUp)
 
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(swipeDown)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
    }
    
    func multiGesture(){
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulit(_:)))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        swipeUp.numberOfTouchesRequired = numOfTouch
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulit(_:)))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        swipeDown.numberOfTouchesRequired = numOfTouch
        self.view.addGestureRecognizer(swipeDown)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulit(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        swipeLeft.numberOfTouchesRequired = numOfTouch
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulit(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        swipeRight.numberOfTouchesRequired = numOfTouch
        self.view.addGestureRecognizer(swipeRight)
    }

    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            imgUp.image = upImgList[0]
            imgDown.image = downImgList[0]
            imgLeft.image = rightImgList[0]
            imgRight.image = leftImgList[0]
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.up:
                imgUp.image = upImgList[1]
            case UISwipeGestureRecognizer.Direction.down:
                imgDown.image = downImgList[1]
            case UISwipeGestureRecognizer.Direction.left:
                imgLeft.image = leftImgList[1]
            case UISwipeGestureRecognizer.Direction.right:
                imgRight.image = rightImgList[1]
            default:
                break
            } }
    }
    
    @objc func respondToSwipeGestureMulit(_ gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            imgUp.image = upImgList[0]
            imgDown.image = downImgList[0]
            imgLeft.image = rightImgList[0]
            imgRight.image = leftImgList[0]
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.up:
                imgUp.image = upImgList[2]
            case UISwipeGestureRecognizer.Direction.down:
                imgDown.image = downImgList[2]
            case UISwipeGestureRecognizer.Direction.left:
                imgLeft.image = leftImgList[2]
            case UISwipeGestureRecognizer.Direction.right:
                imgRight.image = rightImgList[2]
            default:
                break
            } }
    }
}


