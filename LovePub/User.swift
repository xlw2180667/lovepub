//
//  User.swift
//  LovePub
//
//  Created by Xie Liwei on 2017/6/13.
//  Copyright © 2017年 Xie Liwei. All rights reserved.
//

import Foundation
import Alamofire

struct baseURL {
    static let url = "http://visuals.pythonanywhere.com"
}

func createUser(email:String,country:String, viewController : UIViewController,completion:@escaping ([String:Any]) -> Void){
        Alamofire.request("\(baseURL.url)user/", method: .post, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { responses in
        debugPrint(responses)
        switch responses.result{
        case .success(let response):
            var response = response as? [String:Any]
            let status = responses.response?.statusCode
            if status == 200 {
                let header = responses.response!.allHeaderFields as! [String:Any]
                let token = header["token"] as! String
                let user = UserDefaults.standard
                user.set(token, forKey: "token")
                response?["token"] = token
                response?["success"] = true
                completion(response!)
            }
        case .failure(let error):
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
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(settingsUrl, options: [:], completionHandler: { success in
                    })
                } else {
                    UIApplication.shared.openURL(settingsUrl)
                }
            })
            alert.addAction(ok)
            alert.addAction(setting)
            viewController.present(alert, animated: true, completion: nil)
        }
    }
}
