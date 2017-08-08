//
//  SetNameViewController.swift
//  LovePub
//
//  Created by Xie Liwei on 2017/8/8.
//  Copyright © 2017年 Xie Liwei. All rights reserved.
//

import UIKit

class SetNameViewController: UIViewController,UITextFieldDelegate {

    
    @IBOutlet weak var lastnameView: UIView!
    @IBOutlet weak var firstnameView: UIView!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var nameViewTitleLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    
    @IBOutlet weak var firstnameLabel: UILabel!
    
    @IBOutlet weak var lastnameLabel: UILabel!
    
    @IBOutlet weak var firstnameTextField: UITextField!
    
    @IBOutlet weak var lastnameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        firstnameTextField.delegate = self
        lastnameTextField.delegate = self
        firstnameTextField.becomeFirstResponder()
        hideKeyboardWhenTappedAround()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == firstnameTextField {
            if textField.text != ""{
                lastnameTextField.becomeFirstResponder()
                return true
            }
        } else {
            if firstnameTextField.text != "" && lastnameTextField.text != "" {
                confirmName(self)
                return true
            } else {
                let alert = UIAlertController(title: "Oops", message: "Name cannot be empty", preferredStyle: .alert)
                let ok = UIAlertAction(title: "Oh, I forgot!", style: .cancel, handler: nil)
                alert.addAction(ok)
                present(alert, animated: true, completion: nil)
            }
        }
        return false
    }
    

    @IBAction func confirmName(_ sender: Any) {
        let thisUser = getMeTheUser()
        if firstnameTextField.text == "" || lastnameTextField.text == "" {
            let alert = UIAlertController(title: "Oops", message: "Name cannot be empty", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Oh, I forgot!", style: .cancel, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        } else if (firstnameTextField.text == thisUser.firstname && lastnameTextField.text == thisUser.lastname){
            navigationController?.popViewController(animated: true)
        } else {
            let para = ["firstname" : firstnameTextField.text!, "lastname":lastnameTextField.text!]
            updateUser(parameters: para, viewController: self, completion: { response in
                if response["success"] as! Bool == true {
                    self.navigationController?.popViewController(animated: true)
                } else {
                    let alert = UIAlertController(title: "Oops", message: "Reset name failed, try again?", preferredStyle: .alert)
                    let ok = UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                        self.confirmName(self)
                    })
                    let cancel = UIAlertAction(title: "Next time", style: .cancel, handler: { (UIAlertAction) in
                        self.navigationController?.popViewController(animated: true)
                    })
                    alert.addAction(ok)
                    alert.addAction(cancel)
                    self.present(alert, animated: true, completion: nil)
                }
            })
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
