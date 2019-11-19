//
//  CommunityMemberRepresentation.swift
//  BlockClubCalender
//
//  Created by brian vilchez on 11/18/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import Foundation

struct CommunityMemberRepresentation: Codable {
    
    let username: String
    let password: String
    let email: String
    let streetAddress: String
    let city: String
    let zipcode: Int 
}

