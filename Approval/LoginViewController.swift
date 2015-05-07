//
//  LoginViewController.swift
//  Approval
//
//  Created by vichhai on 5/4/15.
//  Copyright (c) 2015 kan vichhai. All rights reserved.
//

import Foundation
import UIKit


class LoginViewController : WCViewController
{
    
    // MARK: helper variables
    // MARK: =---------------------=
    var observer : String?
    
    // MARK: Property Declaration
    // MARK: =---------------------=
    @IBOutlet weak var txtUserId: UITextField!
    @IBOutlet weak var txtPWD: UITextField!
    
    
    // MARK: method about view
    // MARK: =----------------------=
    override func viewDidLoad() {
        AppUtils.showWaitingSplash()
        super.viewDidLoad()
        self.navigationController?.navigationBar.hidden = true
        txtUserId.text = NSUserDefaults.standardUserDefaults().stringForKey("USER_ID")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        AppUtils.showWaitingSplash()
        observer = "APPR_MM0001"
        super.sendTransaction("APPR_MM0001", requestDictionary: nil)
    }
    
    
    override func returnTrans(transCode: String!, responseArray: [AnyObject]!, success: Bool) {
  
        if success{
            if observer == "APPR_LOGIN_R001"{
                AppUtils.closeWaitingSplash()
                NSUserDefaults.standardUserDefaults().setObject(responseArray[0]["USER_ID"], forKey: "USER_ID")
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyBoard.instantiateViewControllerWithIdentifier("HomeViewController") as! UIViewController
                let navi = GateViewCtrl(rootViewController: vc)
                self.presentViewController(navi, animated: true, completion: nil)
                println(responseArray)
            }else {
                AppUtils.closeWaitingSplash()
                println("Response Array is =--------> ",responseArray)
                println("array Count",responseArray.count)
                SessionManager.sharedSessionManager().portalID = responseArray[0]["c_portal_id"] as! String
                SessionManager.sharedSessionManager().channelID = responseArray[0]["c_channel_id"] as! String
                SessionManager.sharedSessionManager().gateWayUrl = responseArray[0]["c_bizplay_url"] as! String
            }
        } else {
            AppUtils.closeWaitingSplash()
        }
    }

    @IBAction func btnLoginAction(sender: UIButton) {
        AppUtils.showWaitingSplash()
        var reqDetail = Dictionary <String,String>()
        reqDetail["PWD"] = txtPWD.text
        reqDetail["USER_ID"] = txtUserId.text
        reqDetail["PTL_ID"] = SessionManager.sharedSessionManager().portalID
        reqDetail["CHNL_ID"] = SessionManager.sharedSessionManager().channelID
        println(reqDetail)
        observer = "APPR_LOGIN_R001"
        super.sendTransaction("APPR_LOGIN_R001", requestDictionary: reqDetail)
    }

}