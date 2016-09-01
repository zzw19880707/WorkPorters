//
//  WPBaseViewController.swift
//  WorkPorters
//
//  Created by cnsyl066 on 16/8/31.
//  Copyright © 2016年 佐筱猪. All rights reserved.
//

import UIKit

class WPBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func showMessageWithAutoDismiss(message : String ) -> Void {
        SVProgressHUD.showWithStatus(message)
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (Int64)( 1 * Double( NSEC_PER_SEC) )), dispatch_get_main_queue()){
            SVProgressHUD.dismiss()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
