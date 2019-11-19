//
//  Event.swift
//  BlockClubCalender
//
//  Created by brian vilchez on 11/16/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import Foundation
import CoreData

extension Event {
    
  var eventRepresentation: EventRepresentation? {
        
        guard let eventAddress = eventAddress,
              let eventDate = eventDate,
             let description = eventDescription,
            let title = title else { return nil }
        
        return EventRepresentation(eventAddress: eventAddress,
                                   eventDate: eventDate,
                                   description: description,
                                   title: title)
    }
    
     convenience init(eventAddress: String,
                     eventDate: Date,
                     eventDescription:String,
                     title: String,
                     context: NSManagedObjectContext){
        
        self.init(context:context)
        
        self.eventAddress = eventAddress
        self.eventDate = eventDate
        self.eventDescription = eventDescription
        self.title = title
        
    }
}
