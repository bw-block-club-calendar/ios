//
//  CommunityMember.swift
//  BlockClubCalender
//
//  Created by brian vilchez on 11/16/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import Foundation
import CoreData

extension CommunityMember {
    
    var communityMemberRepresentation: CommunityMemberRepresentation? {
        
        guard let username = username,
              let password = password,
              let email = email,
              let streetAddress = streetAddress,
            let city = city else { return nil }
        return CommunityMemberRepresentation(username: username,
                                             password: password,
                                             email: email,
                                             streetAddress: streetAddress,
                                             city: city,
                                             zipcode: Int(zipcode))
    }
    
    convenience init(username: String,
                     password: String,
                     email: String,
                     streetAddress: String,
                     city: String,
                     zipcode: Int,
                     context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        
        self.init(context: context)
        self.username = username
        self.password = password
        self.email = email
        self.streetAddress = streetAddress
        self.city = city
        self.zipcode = Int64(zipcode)
    }
    
    @discardableResult convenience init?(communityMemberRepresentation: CommunityMemberRepresentation,
                      context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        
        self.init(username: communityMemberRepresentation.username,
                  password: communityMemberRepresentation.password,
                  email: communityMemberRepresentation.email,
                  streetAddress: communityMemberRepresentation.streetAddress,
                  city: communityMemberRepresentation.city,
                  zipcode: communityMemberRepresentation.zipcode)
    }
}
