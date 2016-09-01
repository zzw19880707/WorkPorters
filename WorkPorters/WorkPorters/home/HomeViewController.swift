//
//  HomeViewController.swift
//  WorkPorters
//
//  Created by cnsyl066 on 16/8/31.
//  Copyright © 2016年 佐筱猪. All rights reserved.
//

import UIKit
import LeanCloud
class HomeViewController: WPBaseViewController {
    
    var isGotoLoginViewController : Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let sessionToken =  NSUserDefaults.standardUserDefaults().stringForKey("sessionToken") {
            LCUser.logIn(sessionToken: sessionToken, completion: { (result) in
                if result.isSuccess { //成功
                    self.title = result.object?.username?.value
                }else { //失败
                    self.isGotoLoginViewController = true
                }
            })
        }else{ //去登陆界面
            isGotoLoginViewController = true
        }
        
        JobQuery.queryAllJobs { (jobs) in
            print(jobs)
        }
        
        print("userName ====  \(LCUser.current?.sessionToken?.JSONString)")

        
        
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if isGotoLoginViewController {
            gotoLogin()
        }
    }
    
    
    func gotoLogin () -> Void {
        UIApplication.sharedApplication().keyWindow?.rootViewController =  self.storyboard?.instantiateViewControllerWithIdentifier("loginNavigationController")
    }
}
