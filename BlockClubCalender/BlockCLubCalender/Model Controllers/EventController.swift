//
//  EventController.swift
//  BlockClubCalender
//
//  Created by brian vilchez on 11/19/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import Foundation
import CoreData

class EventController {
    
    //MARK: - properties
    var events: [Event] = []
    
    //MARK: - C.R.U.D METHODS
    
    ///create
    func createEvent(_ title: String, address: String, description: String, eventDate: Date, context: NSManagedObjectContext) {
        
        let event = Event(eventAddress: address,
                          eventDate: eventDate,
                          eventDescription: description,
                          title: title,
                          context: CoreDataStack.shared.mainContext)
        events.append(event)
        CoreDataStack.shared.mainContext.saveChanges()
    }
    
    ///delete
    func deleteEvent(_ event: Event) {
        CoreDataStack.shared.mainContext.delete(event)
        CoreDataStack.shared.mainContext.saveChanges()
    }
}
