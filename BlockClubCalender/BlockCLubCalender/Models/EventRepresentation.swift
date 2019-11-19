//
//  EventRepresentation.swift
//  BlockClubCalender
//
//  Created by brian vilchez on 11/18/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import Foundation

struct EventRepresentation: Codable {
    
    let eventAddress: String
    let eventDate: Date
    let description: String
    let title: String
}
