//
//  LoginViewModel.swift
//  Danamon-App
//
//  Created by Ricky Gideon Iskandar Daun on 15/02/22.
//

import Foundation

public class LoginViewModel {
    
    func doLogin(email : String, password : String) -> String {
        
        let checkEmail =
        UserDefaults.standard.dictionary(forKey: email)
        
        if checkEmail == nil{
            return "Email belum terdaftar"
        }else{
            
            guard let user = checkEmail else {return "error"}
            
            if user["password"] as! String != password {
                return "Email / Password Salah"
            }else{
                return user["role"] as! String
            }
        }
    }
    
    func checkLogin() -> Bool{
        if UserDefaults.standard.string(forKey: "user-role") != nil {
            return true
        }else{
            return false
        }
    }
}
