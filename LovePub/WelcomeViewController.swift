//
//  WelcomeViewController.swift
//  LovePub
//
//  Created by Xie Liwei on 05/08/2017.
//  Copyright © 2017 Xie Liwei. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var newUserButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    func configureUI() {
        newUserButton.layer.cornerRadius = 5
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.piBlack.cgColor
        loginButton.layer.cornerRadius = 5
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.tintColor = UIColor.piBlack
    }
}
