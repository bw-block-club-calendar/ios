//
//  NSManagedContext.swift
//  BlockClubCalender
//
//  Created by brian vilchez on 11/16/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import Foundation
import CoreData

extension NSManagedObjectContext {
    
    func saveChanges() {
        
        if hasChanges {
            do {
                try save()
            } catch {
                NSLog("error savign to persistence store: \(error.localizedDescription)")
            }
        }
    }
}
