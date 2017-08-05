//
//  HttpFailure.swift
//  LovePub
//
//  Created by Xie Liwei on 05/08/2017.
//  Copyright © 2017 Xie Liwei. All rights reserved.
//

import Foundation
import UIKit

func FailureHttps(viewController:UIViewController, error:Error) {
    let alert = UIAlertController(title: "Ooops", message: "\(error.localizedDescription)", preferredStyle: .alert)
    let ok = UIAlertAction(title: "Close", style: .cancel, handler: {
        UIAlertAction in
        var close : String?
        print(close!)
    })
    let setting = UIAlertAction(title: "Setting", style: .default, handler: { UIAlertAction in
        guard let settingsUrl = URL(string: UIApplicationOpenSettingsURLString) else {
            return
        }
        UIApplication.shared.openURL(settingsUrl)
    })
    alert.addAction(ok)
    alert.addAction(setting)
    viewController.present(alert, animated: true, completion: nil)
}
