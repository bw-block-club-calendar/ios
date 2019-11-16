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
    
    convenience init(eventAddress: String,
                     eventDate: Date,
                     eventDescription:String,
                     geoLocation: String,
                     title: String,
                     context: NSManagedObjectContext){
        
        self.init(context:context)
        
        self.eventAddress = eventAddress
        self.eventDate = eventDate
        self.eventDescription = eventDescription
        self.title = title
        self.geoLocation = geoLocation
        
    }
}
