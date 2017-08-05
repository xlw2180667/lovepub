//
//  LoginViewController.swift
//  LovePub
//
//  Created by Xie Liwei on 05/08/2017.
//  Copyright © 2017 Xie Liwei. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var facebookButtonView: UIView!
    @IBOutlet weak var facebookLoginButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        
    }
    
    func configureUI() {
        facebookButtonView.layer.cornerRadius = 5
        facebookButtonView.layer.borderColor = UIColor.piBlack.cgColor
        facebookButtonView.layer.borderWidth = 1
        
        emailTextField.tintColor = UIColor.piBlack
        passwordTextField.tintColor = UIColor.piBlack
        
    }
    
    // MARK: - TextField delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.returnKeyType == UIReturnKeyType.next {
            passwordTextField.becomeFirstResponder()
        } else if textField.returnKeyType == UIReturnKeyType.send {
            if emailTextField.text == nil {
                let alert = UIAlertController(title: "Oops", message: "Please input email", preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(ok)
                present(alert, animated: true, completion: nil)
            } else {
                if !isValidEmail(testStr: emailTextField.text!) {
                    let alert = UIAlertController(title: "Oops", message: "Please check email format", preferredStyle: .alert)
                    let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alert.addAction(ok)
                    present(alert, animated: true, completion: nil)
                } else {
                    if passwordTextField.text == nil {
                        let alert = UIAlertController(title: "Oops", message: "Password cannot be empty", preferredStyle: .alert)
                        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
                        alert.addAction(ok)
                        present(alert, animated: true, completion: nil)
                    } else {
                        login(username: emailTextField.text!, password: passwordTextField.text!, viewController: self, completion: { response in
                            if response["success"] as! Bool == true {
                                //let data = response["data"] as! [String:Any]
                                let user = UserDefaults.standard

//                                let user_information = data["user_information"] as! [String:Any]
//
//                                let thisUser = User(json: user_information)
//                                let encodeUser = NSKeyedArchiver.archivedData(withRootObject: thisUser)
//                                user.set(encodeUser, forKey: "thisUser")
                                user.set(true, forKey: "isLogin")
                                let delegate = UIApplication.shared.delegate as! AppDelegate
                                delegate.switchViewControllers()

                            } else {
                                let error = response["error"] as! [String:Any]
                                let message = error["message"] as! String
                                let alert = UIAlertController(title: "Oops", message: message, preferredStyle: .alert)
                                let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
                                alert.addAction(ok)
                                self.present(alert, animated: true, completion: nil)
                            }
                        })
                    }
                }
            }
        }
        return false
    }
    

}
