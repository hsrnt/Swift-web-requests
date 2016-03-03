//
//  ViewController.swift
//  71-web requests
//
//  Created by hendri on 3/03/2016.
//  Copyright © 2016 hendri. All rights reserved.
//

import UIKit
import WebKit

////////NOTE: Change plist to allow arbitrary load

class ViewController: UIViewController {
    
    @IBOutlet weak var container: UIView!
    var webView: WKWebView!
    @IBOutlet weak var progressView: UIProgressView!

    override func viewDidLoad() {
        super.viewDidLoad()
        webView = WKWebView()
        container.addSubview(webView)
//        add observer for progress bar
        webView.addObserver(self, forKeyPath: "estimatedProgress", options: .New, context: nil)
    }
    
    override func viewDidAppear(animated: Bool) {
        webView.frame = CGRect(x: 0, y: 0, width: container.bounds.width, height: container.bounds.height)
        loadRequest("http://www.apple.com")
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        progressView.hidden = false
        if keyPath == "estimatedProgress" {
            progressView.progress = Float(webView.estimatedProgress)
        }
        if webView.estimatedProgress >= 1.0 {
            progressView.hidden = true
        }
    }

    
    func loadRequest(urlString:String) {
        //        load url
        let url = NSURL(string: urlString)!
        let urlRequest = NSURLRequest(URL: url)
        webView.loadRequest(urlRequest)
    }
    
    @IBAction func loadSwift(sender: UIButton) {
        loadRequest("https://developer.apple.com/swift/")
    }
    
    @IBAction func loadSteak(sender: UIButton) {
        //        load url
        let url = NSURL(string: "https://en.wikipedia.org/wiki/Steak")!
        let urlRequest = NSURLRequest(URL: url)
        webView.loadRequest(urlRequest)
    }
    
    @IBAction func loadCelebs(sender: UIButton) {
        //        load url
        let url = NSURL(string: "http://www.soerianto.net")!
        let urlRequest = NSURLRequest(URL: url)
        webView.loadRequest(urlRequest)
    }
    


}

