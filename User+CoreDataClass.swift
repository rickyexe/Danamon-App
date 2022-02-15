//
//  User+CoreDataClass.swift
//  Danamon-App
//
//  Created by Ricky Gideon Iskandar Daun on 15/02/22.
//
//

import Foundation
import CoreData
import UIKit

@objc(User)
public class User: NSManagedObject {
    
    class func fetchAllUser() -> Array<User> {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let request = User.fetchRequest() as NSFetchRequest<User>
        
        do{

            let result = try context.fetch(request)
            return result

        } catch  {
            print("error retrieving data")
        }
        
        return []
    }
    
    
    
    class func insertNewUser(email: String, password : String, role: String) -> Bool{
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let newUser = User(context: context)
        newUser.email = email
        newUser.password = password
        newUser.role = role

        //save the data
        do{
            try context.save()
            return true
        }catch{
            print(error)
            return false
        }
        
    }
    
    
//    class func retrieveSpecificUser(email: String) -> User {
//
//
//        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//
//        let request = User.fetchRequest() as NSFetchRequest<User>
//
//        do{
//
//            let result = try context.fetch(request)
//            return result

//        } catch  {
//            print("error retrieving data")
//        }
        
//        return "error"
        
        
//    }

}
