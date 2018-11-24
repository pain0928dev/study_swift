//
//  ViewController.swift
//  examWebView
//
//  Created by 402-24 on 24/11/2018.
//  Copyright © 2018 402-24. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate, UISearchBarDelegate {


    @IBOutlet weak var barSeachBar: UISearchBar!
    @IBOutlet weak var wkDisplay: WKWebView!
    @IBOutlet weak var indLoding: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        wkDisplay.navigationDelegate = self
        barSeachBar.delegate = self
        loadWebPage("https://www.google.com")
        //loadWebPage("https://m.naver.com")
    }

    func loadWebPage(_ url: String){

        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        //wvDisplay.loadRequest(myRequest)

        print("Go URL :: " + url)
        
        indLoding.isHidden = true
        
        wkDisplay.load(myRequest)
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        indLoding.isHidden = true
        barSeachBar.text = wkDisplay.url?.absoluteString
    }
    
    
    
    @IBAction func btnGoURL(_ sender: UIButton) {
        
        if let url = barSeachBar.text {
            
            loadWebPage(url)
        }
    }
    
    @IBAction func btnGoSite1(_ sender: UIButton) {
        loadWebPage("http://www.naver.com")
    }
    @IBAction func btnGoSite2(_ sender: UIButton) {
        loadWebPage("https://m.daum.com")
    }
    @IBAction func btnGoHtml(_ sender: Any) {
    }
    @IBAction func btnGoFile(_ sender: UIButton) {
    }

    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        wkDisplay.stopLoading()
    }
    @IBAction func btnRefresh(_ sender: UIBarButtonItem) {
        wkDisplay.reload()
    }
    @IBAction func btnRewind(_ sender: UIBarButtonItem) {
        wkDisplay.goBack()
    }
    @IBAction func btnFasforward(_ sender: UIBarButtonItem) {
        wkDisplay.goForward()
    }
}

