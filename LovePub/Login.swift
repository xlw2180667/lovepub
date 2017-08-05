//
//  Login.swift
//  LovePub
//
//  Created by Xie Liwei on 05/08/2017.
//  Copyright © 2017 Xie Liwei. All rights reserved.
//

import Foundation
import Alamofire

func login(username:String,password:String, viewController : UIViewController,completion:@escaping ([String:Any]) -> Void) {
    
    let jsonObject : [String:Any] = [
        "email" : username,
        "password" : password
    ]
    
    Alamofire.request("\(baseURL.url)login/", method: .post, parameters: jsonObject, encoding: JSONEncoding.default).responseJSON { responses in
        debugPrint(responses)
        switch responses.result{
        case .success(let response):
            var response = response as? [String:Any]
            let user = UserDefaults.standard
            let status = responses.response?.statusCode
            if status == 200 {
                let header = responses.response!.allHeaderFields as! [String:Any]
                let token = header["token"] as! String
                user.set(token, forKey: "token")
                response?["token"] = token
                response?["success"] = true
                completion(response!)
            } else {
                let header = responses.response!.allHeaderFields as! [String:Any]
                let token = header["token"] as! String
                user.set(token, forKey: "token")
                response?["token"] = token
                response?["success"] = false
                completion(response!)
            }
        case .failure(let error) :
            FailureHttps(viewController: viewController, error: error)
        }
    }
}
