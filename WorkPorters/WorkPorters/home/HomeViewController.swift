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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        JobQuery.queryAllJobs { (jobs) in
            print(jobs)
        }
        
    }
}
