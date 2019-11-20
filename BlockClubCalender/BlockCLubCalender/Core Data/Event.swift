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
    
    convenience init(address: String,
                     eventDate: Date,
                     eventDescription: String,
                     title : String,
                     context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.init(context:context)
        self.address = address
        self.eventDate = eventDate
        self.eventDescription = eventDescription
        self.title = title
    }
}
