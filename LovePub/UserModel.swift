//
//  UserModel.swift
//  LovePub
//
//  Created by Xie Liwei on 05/08/2017.
//  Copyright © 2017 Xie Liwei. All rights reserved.
//

import Foundation

class User : NSObject, NSCoding {
    
    //Mark : Properties
    // Must
    let email : String
    let country : String
    let gender : String
    let id : Int
    //Optional
    let about : String?
    let address : String?
    let city : String?
    let date_of_birth : String?
    let firstname : String?
    let lastname : String?
    let habits : String?
    let has_children : Bool?
    let is_paid : Bool?
    let is_verified : Bool?
    let job_status : String?
    let lat : Double?
    let lng : Double?
    let phone : String?
    let relationship_status : String?
    let religion : String?
    let state : String?
    let tags : String?
    let trivia : String?
    let wants_children : Bool?
    
    //MARK : Initialization
    init(json:[String:Any]) {
        self.email = json["email"] as! String
        self.gender = json["gender"] as! String
        self.country = json["country_name"] as! String
        self.id = json["id"] as! Int

        if let about = json["about"] as? String {
            self.about = about
        } else {
            self.about = nil
        }
        
        if let address = json["address"] as? String {
            self.address = address
        } else {
            self.address = nil
        }
        
        if let city = json["city"] as? String {
            self.city = city
        } else {
            self.city = nil
        }
        
        if let date_of_birth = json["date_of_birth"] as? String {
            self.date_of_birth = date_of_birth
        } else {
            self.date_of_birth = nil
        }
        
        if let firstname = json["firstname"] as? String {
            self.firstname = firstname
        } else {
            self.firstname = nil
        }
        
        if let lastname = json["lastname"] as? String {
            self.lastname = lastname
        } else {
            self.lastname = nil
        }
        
        if let habits = json["habits"] as? String {
            self.habits = habits
        } else {
            self.habits = nil
        }
        
        if let has_children = json["has_children"] as? Bool {
            self.has_children = has_children
        } else {
            self.has_children = nil
        }
        
        if let is_paid = json["is_paid"] as? Bool {
            self.is_paid = is_paid
        } else {
            self.is_paid = nil
        }
        
        if let is_verified = json["is_verified"] as? Bool {
            self.is_verified = is_verified
        } else {
            self.is_verified = nil
        }
        
        if let job_status = json["job_status"] as? String {
            self.job_status = job_status
        } else {
            self.job_status = nil
        }
        
        if let lat = json["lat"] as? Double {
            self.lat = lat
        } else {
            self.lat = nil
        }
        
        if let lng = json["lng"] as? Double {
            self.lng = lng
        } else {
            self.lng = nil
        }
        
        if let phone = json["phone"] as? String {
            self.phone = phone
        } else {
            self.phone = nil
        }
        
        if let relationship_status = json["relationship_status"] as? String {
            self.relationship_status = relationship_status
        } else {
            self.relationship_status = nil
        }
        
        if let religion = json["religion"] as? String {
            self.religion = religion
        } else {
            self.religion = nil
        }
        
        if let state = json["state"] as? String {
            self.state = state
        } else {
            self.state = nil
        }
        
        if let tags = json["tags"] as? String {
            self.tags = tags
        } else {
            self.tags = nil
        }
        
        if let trivia = json["trivia"] as? String {
            self.trivia = trivia
        } else {
            self.trivia = nil
        }
        
        if let wants_children = json["wants_children"] as? Bool {
            self.wants_children = wants_children
        } else {
            self.wants_children = nil
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.email = aDecoder.decodeObject(forKey: "email") as? String ?? ""
        self.country = aDecoder.decodeObject(forKey: "country") as? String ?? ""
        self.gender = aDecoder.decodeObject(forKey: "gender") as? String ?? ""
        self.id = aDecoder.decodeInteger(forKey: "id")
        self.about = aDecoder.decodeObject(forKey: "about") as? String ?? ""
        self.address = aDecoder.decodeObject(forKey: "address") as? String ?? ""
        self.city = aDecoder.decodeObject(forKey: "city") as? String ?? ""
        self.date_of_birth = aDecoder.decodeObject(forKey: "date_of_birth") as? String ?? ""
        self.firstname = aDecoder.decodeObject(forKey: "firstname") as? String ?? ""
        self.lastname = aDecoder.decodeObject(forKey: "lastname") as? String ?? ""
        self.habits = aDecoder.decodeObject(forKey: "habits") as? String ?? ""
        self.has_children = aDecoder.decodeObject(forKey: "has_children") as? Bool ?? false
        self.is_paid = aDecoder.decodeObject(forKey: "is_paid") as? Bool ?? false
        self.is_verified = aDecoder.decodeObject(forKey: "is_verified") as? Bool ?? false
        self.job_status = aDecoder.decodeObject(forKey: "job_status") as? String ?? ""
        self.lat = aDecoder.decodeObject(forKey: "lat") as? Double ?? 0
        self.lng = aDecoder.decodeObject(forKey: "lng") as? Double ?? 0
        self.phone = aDecoder.decodeObject(forKey: "phone") as? String ?? ""
        self.relationship_status = aDecoder.decodeObject(forKey: "relationship_status") as? String ?? ""
        self.religion = aDecoder.decodeObject(forKey: "religion") as? String ?? ""
        self.state = aDecoder.decodeObject(forKey: "state") as? String ?? ""
        self.tags = aDecoder.decodeObject(forKey: "tags") as? String ?? ""
        self.trivia = aDecoder.decodeObject(forKey: "trivia") as? String ?? ""
        self.wants_children = aDecoder.decodeObject(forKey: "wants_children") as? Bool ?? false
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(email, forKey:"email")
        aCoder.encode(country, forKey:"country")
        aCoder.encode(gender, forKey:"gender")
        aCoder.encode(id, forKey:"id")
        aCoder.encode(about, forKey:"about")
        aCoder.encode(address, forKey:"address")
        aCoder.encode(city, forKey:"city")
        aCoder.encode(date_of_birth, forKey:"date_of_birth")
        aCoder.encode(firstname, forKey:"firstname")
        aCoder.encode(lastname, forKey:"lastname")
        aCoder.encode(habits, forKey:"habits")
        aCoder.encode(has_children, forKey:"has_children")
        aCoder.encode(is_paid, forKey:"is_paid")
        aCoder.encode(is_verified, forKey:"is_verified")
        aCoder.encode(job_status, forKey:"job_status")
        aCoder.encode(lat, forKey:"lat")
        aCoder.encode(lng, forKey:"lng")
        aCoder.encode(phone, forKey:"phone")
        aCoder.encode(relationship_status, forKey:"relationship_status")
        aCoder.encode(religion, forKey:"religion")
        aCoder.encode(state, forKey:"state")
        aCoder.encode(tags, forKey:"tags")
        aCoder.encode(trivia, forKey:"trivia")
        aCoder.encode(wants_children, forKey:"wants_children")
    }
}

func getMeTheUser() -> User {
    let user = UserDefaults.standard.data(forKey: "thisUser")
    let thisUser = NSKeyedUnarchiver.unarchiveObject(with: user!) as! User
    return thisUser
}
