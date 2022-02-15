//
//  User+CoreDataProperties.swift
//  Danamon-App
//
//  Created by Ricky Gideon Iskandar Daun on 15/02/22.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var id: Int16
    @NSManaged public var email: String?
    @NSManaged public var password: String?
    @NSManaged public var role: String?

}

extension User : Identifiable {

}
