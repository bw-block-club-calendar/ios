//
//  Member.swift
//  BlockClubCalender
//
//  Created by brian vilchez on 11/19/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import Foundation
import CoreData

extension Member {
    
    var memberRepresentation: CommunityMemberRepresentation? {
        
        guard let username = username, let password = password, let email = email,
            let city = city else { return nil}
            
        return CommunityMemberRepresentation(username: username, password: password, email: email, city: city, isBusiness: isBusiness, events: events?.array as! [EventRepresentation])
    }
    
  @discardableResult convenience init(username: String,
                       password: String,
                       email: String,
                       isBusiness:Bool,
                       city: String,
                       events: [Event],
                       context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
          
          self.init(context: context)
        self.username = username
        self.password = password
        self.email = email
        self.isBusiness = isBusiness
        self.city = city
        self.events = NSOrderedSet(object: events)
      }
    
    
}
