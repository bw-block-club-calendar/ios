//
//  CommunityMemberController.swift
//  BlockClubCalender
//
//  Created by brian vilchez on 11/19/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import Foundation
import CoreData
class MemberController {
    
    //MARK: - Properties
    var member: Member?
    
    //MARK: - C.R.U.D METHODS
      
      ///create
      func createEvent(_ title: String, address: String, description: String, eventDate: Date) {
        let event = Event(address: address, eventDate: eventDate, eventDescription: description, title: title, context: CoreDataStack.shared.mainContext)
        CoreDataStack.shared.mainContext.saveChanges()
      }
      
    func loginUser(_ username: String, password: String) {
        
    }
    
    func Register(username: String, password: String, email: String, isBusiness: Bool, city: String) {
        let member = Member(username: username, password: password, email: email, isBusiness: isBusiness, city: city, events: [], context: CoreDataStack.shared.mainContext)
            CoreDataStack.shared.mainContext.saveChanges()
    }
      ///delete
      func deleteEvent(_ event: Event) {
          CoreDataStack.shared.mainContext.delete(event)
          CoreDataStack.shared.mainContext.saveChanges()
      }
}
