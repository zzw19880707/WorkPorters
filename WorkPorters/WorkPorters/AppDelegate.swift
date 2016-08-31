//
//  AppDelegate.swift
//  WorkPorters
//
//  Created by cnsyl066 on 16/8/31.
//  Copyright © 2016年 佐筱猪. All rights reserved.
//

import UIKit
import LeanCloud

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        leanCloud(launchOptions)
        return true
    }
    
    ///云平台
    func leanCloud (launchOptions: [NSObject: AnyObject]?) -> Void {
        LeanCloud.initialize(applicationID: "muXJIu6f5vfs0pBy6QFoKmNx-gzGzoHsz", applicationKey: "SWFzjDpmJSqAHHoETNc7tUJ5")
    }

}

