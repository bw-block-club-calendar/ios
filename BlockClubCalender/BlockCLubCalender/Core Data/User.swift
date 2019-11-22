//
//  User.swift
//  BlockClubCalender
//
//  Created by brian vilchez on 11/21/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import Foundation
import CoreData

extension User {
    
    var userRepresentation: UserRepresentation? {
        
        guard let username = username, let password = password,
            let email = email else { return nil}
        
        return UserRepresentation(username: username, password: password, email: email)
    }
    convenience init(firstName: String,
                     lastName: String,
                     userName: String,
                     password: String,
                     email: String,
                     context: NSManagedObjectContext = CoreDataStack.shared.mainContext){
        self.init(context: context)
        self.username = userName
        self.password = password
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        
    }
}
