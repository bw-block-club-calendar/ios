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
    
    var organizationRepresentation: OrganizationRepresentation? {
        guard let username = username,
          let password = password,
          let email = email,
            let businessName = businessName,
          let streetAddress = streetAddress,
        let city = city else { return nil }
        
        return OrganizationRepresentation(username: username, password: password, email: email, businessName: businessName, streetAddress: streetAddress, city: city, zipcode: Int(zipcode))
    }
    
    convenience init(username: String,
                     password: String,
                     email: String,
                     businessName: String,
                     streetAddress: String,
                     city: String,
                     zipcode: Int,
                     context: NSManagedObjectContext = CoreDataStack.shared.mainContext){
          
          self.init(context: context)
            
        self.username = username
        self.password = password
        self.email = email
        self.businessName = businessName
        self.streetAddress = streetAddress
        self.city = city
        self.zipcode = Int64(zipcode)
        
      }
    
  @discardableResult convenience init?(organizationRepresentation: OrganizationRepresentation,
                        context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
          
        self.init(username: organizationRepresentation.username,
                       password: organizationRepresentation.password,
                       email: organizationRepresentation.email,
                       businessName: organizationRepresentation.businessName,
                       streetAddress: organizationRepresentation.streetAddress,
                       city: organizationRepresentation.city,
                       zipcode: organizationRepresentation.zipcode)
      }
}
