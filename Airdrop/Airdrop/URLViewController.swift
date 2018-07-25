//
//  URLViewController.swift
//  Airdrop
//
//  Created by Carlos Butron on 01/01/2018.
//  Copyright © 2018 Carlos Butron. All rights reserved.
//

import UIKit

class URLViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var myURL: UITextField!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var webView2: UIWebView!
    
    @IBAction func send(_ sender: UIButton) {
        let urlString = verifyUrlText()
        if urlString.count == 0 {
            return
        }
        let url:URL = URL(string: urlString)!
        let controller = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func load(_ sender: UIButton) {
        let urlString = verifyUrlText()
        if urlString.count == 0 {
            return
        }
        
        let request = URLRequest(url: URL(string: urlString)!)
        self.webView2.loadRequest(request)
    }
    
    func verifyUrlText() -> String {
        let urlString: String = myURL.text!
        if urlString.count == 0 {
            let alertController = UIAlertController(title: "提示", message: "请输入地址", preferredStyle: .alert)
            let action = UIAlertAction(title: "确定", style: .cancel, handler: nil)
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
            return ""
        }
        else {
            return urlString
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView2.delegate = self
        
        //1. Load web site into my web view
        
        let myURL = URL(string: "http://yorkieapp.com/");
        let myURLRequest:URLRequest = URLRequest(url: myURL!);
        webView2.loadRequest(myURLRequest);
        
//        // Do any additional setup after loading the view, typically from a nib.
//        let url = NSURL (string: "http://www.google.com");
//        let request = NSURLRequest(URL: url!);
//        webView2.loadRequest(request);
        
//        myURL.text = "http://yorkieapp.com/"
//        webView2.delegate = self
//        let request = NSURLRequest(URL: NSURL(string: myURL.text!)!)
//        self.webView2.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
