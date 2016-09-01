//
//  LoginViewController.swift
//  WorkPorters
//
//  Created by cnsyl066 on 16/9/1.
//  Copyright © 2016年 佐筱猪. All rights reserved.
//

import UIKit
import LeanCloud
import CryptoSwift
class LoginViewController: WPBaseViewController {
    

    var isPasswordLogin : Bool = true
    
    
    @IBOutlet weak var securityCodeView: UIView!
    @IBOutlet weak var passwordView: UIView!
    
    @IBOutlet weak var usernameTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var validateCodeTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Action
    @IBAction func loginAction(sender: AnyObject) {
        if isPasswordLogin { //密码登陆
            LCUser.logIn(username: usernameTF.text!, password: passwordTF.text!.md5(), completion: { ( result ) in
                if result.isSuccess {
                    NSUserDefaults.standardUserDefaults().setValue(result.object?.sessionToken?.value, forKey: "sessionToken")
                    NSUserDefaults.standardUserDefaults().synchronize()
                    UIApplication.sharedApplication().keyWindow?.rootViewController = self.storyboard?.instantiateViewControllerWithIdentifier("MainViewController")
                }else{
                    self.showMessageWithAutoDismiss("用户名或密码错误")
                }
            })
            
        }else { //验证码
            
        }
        
    }
    @IBAction func loginStateChange(sender: UISegmentedControl) {
        isPasswordLogin = !isPasswordLogin
        securityCodeView.hidden = isPasswordLogin
        passwordView.hidden = !isPasswordLogin
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