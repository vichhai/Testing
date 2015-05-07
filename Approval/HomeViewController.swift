//
//  HomeViewController.swift
//  Approval
//
//  Created by vichhai on 5/4/15.
//  Copyright (c) 2015 kan vichhai. All rights reserved.
//

import Foundation

class HomeViewController : WCViewController ,UIWebViewDelegate{
    
    @IBOutlet weak var mainWebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        var strURL =  SessionManager.sharedSessionManager().gateWayUrl + "/APPROVAL_MAIN_101.act"
        let url : NSURLRequest = NSURLRequest(URL: NSURL(string: strURL)!)
        #if DEBUG
            print(url)
        #endif
        mainWebView.loadRequest(url)
        mainWebView.scrollView.bounces = false
        mainWebView.scrollView.scrollEnabled = false
        self.title = "비플 결재함"
        AppUtils.settingRightButton(self, action: "btnMoreMenuClicked:", normalImageCode: "top_more_btn.png", highlightImageCode: "top_more_btn_p.png")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // MARK: btnMoreMenuClicked Action
    // MARK: =---------------------------=
    func btnMoreMenuClicked(sender : UIButton) {
        let alert = UIAlertController(title: "Alert", message: "View More", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
  
    // MARK: webview delegate method
    // MARK: =---------------------------=
    override func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        if SysUtils.isNull(request) == true || SysUtils.isNull(request.URL) == true {
            return false
        }
        let URLString:String?  = request.URL?.absoluteString
        let decode : String? = URLString?.stringByReplacingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
        
        #if DEBUG
            print(decode)
        #endif
        
        let URLScheme: String? = request.URL?.scheme
        
        if URLScheme == "iwebactionba" || URLScheme == "iWebActionBA"{
            var range : NSRange?
            var action : String?
            
            if URLScheme == "iWebActionBA" {
                range = decode?.rangeOfString("iWebActionBA:", options: nil, range: nil, locale: nil)
                action = decode?.substringFromIndex(range.location + 21)
            }
            
        }
        
        return true
    }
    
    @IBAction func shareButtonAction(sender: UIButton) {
        
        var url : String?
        
        switch sender.tag {
        case 1000:
            url = SessionManager.sharedSessionManager().gateWayUrl + "/APPROVAL_101.act"
        case 1001 :
                url = SessionManager.sharedSessionManager().gateWayUrl + "/APPROVAL_102.act"
        default:
            url = SessionManager.sharedSessionManager().gateWayUrl + "/APPROVAL_103.act"
            break
        }
        
        // =-----> I create object WebStyleViewcontroller
        let webView = WebStyleViewController(URL: url) as WebStyleViewController
//        self.navigationController?.pushViewController(webView, animated: true)
        self.navigationController?.pushViewController(webView, animated: true)
    }
    
    
}