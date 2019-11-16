//
//  Organization.swift
//  BlockClubCalender
//
//  Created by brian vilchez on 11/16/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import Foundation
import CoreData

extension Organization {
    
    convenience init(username: String,
                     password: String,
                     email: String,
                     businessName: String,
                     streetAddress: String,
                     city: String,
                     zipcode: Int,
                     context: NSManagedObjectContext){
          
          self.init(context: context)
            
        self.username = username
        self.password = password
        self.email = email
        self.businessName = businessName
        self.streetAddress = streetAddress
        self.city = city
        self.zipcode = Int64(zipcode)
        
      }
}
