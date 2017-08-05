//
//  UserModel.swift
//  LovePub
//
//  Created by Xie Liwei on 05/08/2017.
//  Copyright © 2017 Xie Liwei. All rights reserved.
//

import Foundation

class User {
    
    //Mark : Properties
    let email : String
    let country : String
    let gender : String
    
    //MARK : Initialization
    init(email: String, country: String, gender: String) {
        self.email = email
        self.country = country
        self.gender = gender
    }
}
