//
//  ViewController.swift
//  Map
//
//  Created by 402-24 on 25/11/2018.
//  Copyright © 2018 402-24. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var segPlace: UISegmentedControl!
    @IBOutlet weak var lblNowPosition: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var mapMyView: MKMapView!
    
    let locationManager = CLLocationManager() // 맵을 사용하기 위한 객체 생성
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //lblNowPosition.text = ""
        //lblAddress.text = ""
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest   // 맵에 대한 정확도
        locationManager.requestWhenInUseAuthorization()             // 사용 인증 요청
        locationManager.startUpdatingLocation()                     // 현재 위치 업데이트
        locationManager.showsBackgroundLocationIndicator = true
        
        mapMyView.showsUserLocation = true                          // 현재 위치를 표시

    }

    func goLocation(latitude: CLLocationDegrees, longitude: CLLocationDegrees, delta span: Double){
        // 위도, 경도에 맞는 현재 위치 가져오기
        
        //ex: 37.570169,126.98309900000004
        let pLocation = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
  
        //locationManager.startUpdatingLocation()
        mapMyView.setRegion(pRegion, animated: true)
  
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        print("didUpdate")
        
        let pLocation = userLocation.coordinate
        
        CLGeocoder().reverseGeocodeLocation(CLLocation(latitude: pLocation.latitude, longitude: pLocation.longitude)) { (placemark, error) in
            
            let pm = placemark?.first
            let countury = pm!.country
            var address:String = countury!
            
            if pm!.locality != nil {
                address += ""
                address += pm!.locality!
            }
            
            if pm!.thoroughfare != nil {
                address += " "
                address += pm!.thoroughfare!
            }
            
            print("address: \(address)")
            self.lblNowPosition.text = "현재위치"
            self.lblAddress.text = address
        }
    }
    

    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        print("1")
        print(#function)
    }
    
    func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
        print(#function)
        print("2")
    }
    
    func mapView(_ mapView: MKMapView, didFailToLocateUserWithError error: Error) {
        print("error 111")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let pLocation = locations.last
        
        print("didUpdateLocation :: " + pLocation.debugDescription )
        
        goLocation(latitude: (pLocation?.coordinate.latitude)!, longitude: (pLocation?.coordinate.longitude)!, delta: 0.1)
        
        
        CLGeocoder().reverseGeocodeLocation(pLocation!) { (placemark, error) in
            
            let pm = placemark?.first
            let countury = pm!.country
            var address:String = countury!
            
            if pm!.locality != nil {
                address += ""
                address += pm!.locality!
            }
            
            if pm!.thoroughfare != nil {
                address += " "
                address += pm!.thoroughfare!
            }
            
            print("address: \(address)")
            self.lblNowPosition.text = "현재위치"
            self.lblAddress.text = address
         }
        
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("didChangedAuthorization")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("didFailWithError : " + error.localizedDescription)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        print("didUpdateheading")
    }

    
    @IBAction func segBtnChangePosition(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            var lat: CLLocationDegrees = 37.570169
            var lon: CLLocationDegrees = 126.98309900000004
            //goLocation(latitude: lat, longitude: lon, delta: 0.1)
            

            locationManager.requestLocation()
        }
        else if sender.selectedSegmentIndex == 1 {
            // 우리집: 37.6269285,127.0217652
            var lat: CLLocationDegrees = 37.6269285
            var lon: CLLocationDegrees = 127.0217652
            goLocation(latitude: lat, longitude: lon, delta: 0.1)
        }
        else if sender.selectedSegmentIndex == 2 {
            // 남성프라자: 37.4754508,126.88170909999997
            var lat: CLLocationDegrees = 37.4754508
            var lon: CLLocationDegrees = 126.88170909999997
            goLocation(latitude: lat, longitude: lon, delta: 0.1)
        }

        
        
    }
    
}

