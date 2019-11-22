//
//  Token.swift
//  BlockClubCalender
//
//  Created by brian vilchez on 11/21/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import Foundation
import CoreData

extension Token {
    
    
    
    convenience init(token: String, context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.init(context: context)
        self.token = token
    }
    
    convenience init(token: BearerToken, context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.init(token: token.token)
    }
}
