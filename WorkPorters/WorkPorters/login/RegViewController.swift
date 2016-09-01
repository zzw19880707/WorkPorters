//
//  RegViewController.swift
//  WorkPorters
//
//  Created by cnsyl066 on 16/9/1.
//  Copyright © 2016年 佐筱猪. All rights reserved.
//

import UIKit
import LeanCloud
import CryptoSwift
class RegViewController: WPBaseViewController {
    @IBOutlet weak var validateCodeTF: UITextField!
    @IBOutlet weak var pwdTF: UITextField!
    @IBOutlet weak var usernameTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func sendValidateCodeAction(sender: AnyObject) {
        
    }
    @IBAction func regAction(sender: AnyObject) {
        
        SVProgressHUD.showWithStatus("注册中...")
                let queue = dispatch_queue_create("queue", nil)
        dispatch_async(queue) { 
            let user = LCUser()
            user.username = LCString(self.usernameTF.text!)
            user.password = LCString(self.pwdTF.text!.md5())
            user.mobilePhoneNumber = LCString(self.usernameTF.text!)
            let result = user.signUp()
            if result.isSuccess {
                dispatch_sync(dispatch_get_main_queue(), {
                    SVProgressHUD.dismiss()
                    self.navigationController?.popViewControllerAnimated(true)
                })
            }else {
                dispatch_sync(dispatch_get_main_queue(), {
                    let code = result.error!.code
                    if code == 202 { //用户名重复
                        self.showMessageWithAutoDismiss("用户名重复")
                        

                        return
                    }else if code == 203 { //邮箱重复
                        self.showMessageWithAutoDismiss("邮箱重复了")

                    }else if code == 214 { //手机号重复
                        self.showMessageWithAutoDismiss("用户名重复")

                    }else{
                        self.showMessageWithAutoDismiss("注册失败")
                    }
                })
            }
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
