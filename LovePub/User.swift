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
    static let url = "https://visuals.pythonanywhere.com/"
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
            FailureHttps(viewController: viewController, error: error)
        }
    }
}

func getUser(viewController : UIViewController,completion:@escaping ([String:Any]) -> Void){
    let user = UserDefaults.standard
    let token = user.object(forKey: "token") as! String
    let headers : HTTPHeaders = ["token":token]
    Alamofire.request("\(baseURL.url)user/", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON { responses in
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
            FailureHttps(viewController: viewController, error: error)
        }
    }
}

func updateUser(parameters:[String:Any], viewController : UIViewController,completion:@escaping ([String:Any]) -> Void){
    let user = UserDefaults.standard
    let token = user.object(forKey: "token") as! String
    let headers : HTTPHeaders = ["token":token]
    Alamofire.request("\(baseURL.url)user/", method: .put, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { responses in
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
                let user_information = (response?["data"] as! [String:Any])["user_information"] as! [String:Any]
                let thisUser = User(json: user_information)
                let encodeUser = NSKeyedArchiver.archivedData(withRootObject: thisUser)
                user.set(encodeUser, forKey: "thisUser")
                completion(response!)
            } else {
                let header = responses.response!.allHeaderFields as! [String:Any]
                let token = header["token"] as! String
                let user = UserDefaults.standard
                user.set(token, forKey: "token")
                response?["token"] = token
                response?["success"] = false
                completion(response!)
            }
        case .failure(let error):
            FailureHttps(viewController: viewController, error: error)
        }
    }
}
