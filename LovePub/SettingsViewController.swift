//
//  SettingsViewController.swift
//  LovePub
//
//  Created by Xie Liwei on 06/08/2017.
//  Copyright © 2017 Xie Liwei. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var relationshipLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var religionLabel: UILabel!
    
    
    
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var genderView: UIView!
    @IBOutlet weak var birthdayView: UIView!
    @IBOutlet weak var addressView: UIView!
    @IBOutlet weak var phoneView: UIView!
    @IBOutlet weak var persenalView: UIView!
    @IBOutlet weak var relationshipView: UIView!
    @IBOutlet weak var jobView: UIView!
    @IBOutlet weak var religionView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    
    @IBOutlet weak var aboutTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setupViewResizerOnKeyboardShown()
        hideKeyboardWhenTappedAround()
        aboutTextView.delegate = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        updatePersonalView()
        updateAboutView()
        updateStatusView()
    }
    
    func configureUI() {
        let views = [nameView,emailView,genderView,birthdayView,addressView,relationshipView,jobView]
        for thisView in views {
            addBottomLineForView(view: thisView!, color: UIColor.piSilver, height: thisView!.frame.height)
        }
        scrollView.keyboardDismissMode = .interactive
    }
    
    func updatePersonalView () {
        let user = getMeTheUser()
        emailLabel.text = user.email
        if user.lastname != "" {
            nameLabel.text = user.firstname! + " " + user.lastname!
        }
        
        if user.gender != "" {
            genderLabel.text = user.gender
        }
        
        if user.date_of_birth != "" {
            let dateFormat = DateFormatter()
            dateFormat.dateFormat = "yyyy-MM-dd"
            let birthdayDate = dateFormat.date(from: user.date_of_birth!)
            dateFormat.dateFormat = "MMM,dd,yyyy"
            birthdayLabel.text = dateFormat.string(from: birthdayDate!)
        }
        if user.address != "" {
            addressLabel.text = user.address!
        }
        if user.phone != "" {
            phoneLabel.text = user.phone!
        }
    }
    func updateAboutView () {
        aboutTextView.text = getMeTheUser().about!
    }
    func updateStatusView() {
        let user = getMeTheUser()
        if user.relationship_status != "" {
            relationshipLabel.text = user.relationship_status!
        }
        if user.job_status != "" {
            jobLabel.text = user.job_status!
        }
        if user.religion != "" {
            religionLabel.text = user.religion!
        }
    }
    
    @IBAction func setName(_ sender: Any) {
        
    }
    
    @IBAction func setGender(_ sender: Any) {
        let alert = UIAlertController(title: nil, message: "Gender", preferredStyle: .actionSheet)
        let male = UIAlertAction(title: "Male", style: .default) { UIAlertAction in
            let parameters = ["gender": "male"]
            updateUser(parameters: parameters, viewController: self, completion: { (response) in
                self.genderLabel.text = "male"
            })
        }
        let female = UIAlertAction(title: "Female", style: .default) { UIAlertAction in
            let parameters = ["gender": "female"]
            updateUser(parameters: parameters, viewController: self, completion: { (response) in
                self.genderLabel.text = "female"
            })
        }
        let cancle = UIAlertAction(title: "Cancle", style: .cancel, handler: nil)
        alert.addAction(male)
        alert.addAction(female)
        alert.addAction(cancle)
        alert.view.tintColor = UIColor.piRed
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func setBirthday(_ sender: Any) {
    }
    
    @IBAction func setAddress(_ sender: Any) {
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        // update to server
        if aboutTextView.text != getMeTheUser().about! {
            var parameters = [String:Any]()
            if aboutTextView.text == "" {
                parameters = ["about" : " "]
            } else {
                parameters = ["about" : aboutTextView.text!]
            }
            updateUser(parameters: parameters, viewController: self) { response in
                if response["success"] as! Bool == false {
                    self.aboutTextView.text = getMeTheUser().about!
                }
            }
        }

    }
    
    // MARK: - Adjust scrollview when keyboard appear
    func keyboardWillShowOrHide(notification: NSNotification) {
        
        if let userInfo = notification.userInfo, let endValue = userInfo[UIKeyboardFrameEndUserInfoKey], let durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey], let curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] {
            
            let endRect = view.convert((endValue as AnyObject).cgRectValue, from: view.window)
            let keyboardOverlap = scrollView.frame.maxY - endRect.origin.y
            scrollView.contentInset.bottom = keyboardOverlap
            scrollView.scrollIndicatorInsets.bottom = keyboardOverlap
            
            let duration = (durationValue as AnyObject).doubleValue
            let options = UIViewAnimationOptions(rawValue: UInt((curveValue as AnyObject).integerValue << 16))
            UIView.animate(withDuration: duration!, delay: 0, options: options, animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    func setupViewResizerOnKeyboardShown() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(SettingsViewController.keyboardWillShowOrHide(notification:)),
                                               name: Notification.Name.UIKeyboardWillShow,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(SettingsViewController.keyboardWillShowOrHide(notification:)),
                                               name: Notification.Name.UIKeyboardWillHide,
                                               object: nil)
    }
}
