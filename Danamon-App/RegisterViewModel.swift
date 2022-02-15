//
//  RegisterViewModel.swift
//  Danamon-App
//
//  Created by Ricky Gideon Iskandar Daun on 15/02/22.
//

import Foundation

public class RegisterViewModel {
    
    func doRegister(email : String, password: String, confirmationPassword : String, role : String) -> Int {
        
        if password != confirmationPassword {
            return 0
        }
        
        let checkEmail =
        UserDefaults.standard.dictionary(forKey: email)
        
        
        if checkEmail == nil {
            UserDefaults.standard.set(["password" : password,
                                       "role" : role
                                      ], forKey: email)
            return 2
        }else{
            return 1
        }
        
        
    
    }
    
    
//    func doRegisterDict(email : String, password: String, confirmationPassword : String, role : String) -> Int {
//
//        if password != confirmationPassword {
//            return 0
//        }
//
//        var checkEmail =
//        UserDefaults.standard.array(forKey: "user")!
//
//
//        if checkEmail == nil {
//
//            checkEmail.append([
//                "email" : email,
//                "password" : password,
//                "role" : role])
//
//            return 2
//        }else{
//            return 1
//        }
//
//
//        if checkEmail == nil {
//            UserDefaults.standard.set(["password" : password,
//                                       "role" : role
//                                      ], forKey: email)
//            return 2
//        }else{
//            return 1
//        }
//
//    }
//
    
    
}
