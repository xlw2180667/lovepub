//
//  ProfileViewController.swift
//  LovePub
//
//  Created by Xie Liwei on 06/08/2017.
//  Copyright © 2017 Xie Liwei. All rights reserved.
//

import UIKit
import SDWebImage
class ProfileViewController: UIViewController {
    @IBOutlet weak var profilePhotoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var interestButton: UIButton!
    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        initialData()
        // Do any additional setup after loading the view.
    }

    func configureUI() {
        profilePhotoImageView.layer.cornerRadius = profilePhotoImageView.layer.bounds.width / 2
        profilePhotoImageView.layer.masksToBounds = true
        let url = URL(string: "https://scontent-arn2-1.xx.fbcdn.net/v/t1.0-9/13418696_867688870002098_3179344016098423113_n.jpg?oh=ef336c92674f24e6c1be814cf27b7bd7&oe=59F901C2")
        profilePhotoImageView.sd_setImage(with: url, placeholderImage: UIImage(named: "profile_pic"))
        


        interestButton.layer.cornerRadius = interestButton.layer.bounds.width / 2
        settingButton.layer.cornerRadius = settingButton.layer.bounds.width / 2
        logoutButton.layer.cornerRadius = 5
    }
    
    func initialData() {
        getUser(viewController: self) { response in
            let user_information = (response["data"] as! [String:Any])["user_information"] as! [String:Any]
            let thisUser = User(json: user_information)
            let user = UserDefaults.standard
            let encodeUser = NSKeyedArchiver.archivedData(withRootObject: thisUser)
            user.set(encodeUser, forKey: "thisUser")
            let firstname = thisUser.firstname
            let lastname = thisUser.lastname
            if firstname != "" {
                self.nameLabel.text = firstname! + ", " + lastname!
            } else {
                self.nameLabel.text = "Are you noname?"
            }
        }
    }
    @IBAction func logout(_ sender: Any) {
        let alert = UIAlertController(title: "Logout", message: nil, preferredStyle: .actionSheet)
        let ok = UIAlertAction(title: "Yes", style: .default) { okAlert in
            if let bundle = Bundle.main.bundleIdentifier {
                UserDefaults.standard.removePersistentDomain(forName: bundle)
            }
            //        UIApplication.shared.unregisterForRemoteNotifications()
            //        NotificationCenter.default.removeObserver(NSNotification.Name.UIApplicationDidBecomeActive)
            UIApplication.shared.keyWindow?.rootViewController = self.storyboard?.instantiateViewController(withIdentifier: "root")
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(ok)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
}
