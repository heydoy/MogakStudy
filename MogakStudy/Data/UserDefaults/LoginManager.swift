//
//  LoginManager.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/15.
//

import Foundation

class LoginManager {

    static let shared = LoginManager()
    
    var idToken: String? {
        get {
            UserDefaults.standard.string(forKey: "idToken")
            
        } set {
            UserDefaults.standard.setValue(newValue, forKey: "idToken")
        }
    }
   
    var FCMtoken: String? {
        get {
            UserDefaults.standard.string(forKey: "FCMtoken")
        } set {
            UserDefaults.standard.setValue(newValue, forKey: "FCMtoken")
        }
    }
}
