//
//  MockData.swift
//  BlockClubCalenderUITests
//
//  Created by Jerry haaser on 11/21/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import Foundation

let goodEventData = """
[
  {
    "event_id": 2,
    "user_id": 4,
    "organizer_type": "organization",
    "title": "Trunk-or-Treat with the Lower North End Block Club",
    "description": "Bring your friends and family to enjoy a night of fright on the Michigan Urban Farming Initiative's Campus! There will be handy, hot dog roasting, and a Zombie Walk for the kids.",
    "start": "2019-10-31T18:00:00-0500",
    "end": "2019-10-31T20:00:00-0500",
    "ext_link": null,
    "image": "https://i.ibb.co/hK3St7F/LNE-TOT.png",
    "approved": true,
    "location": {
      "id": 1,
      "name": "Michigan Urban Farming Initiative",
      "coordinates": null,
      "street_address": "7432 Brush St",
      "street_address_2": null,
      "city": "Detroit",
      "zipcode": "48202",
      "state": "MI"
    }
  },
  {
    "event_id": 1,
    "user_id": 3,
    "organizer_type": "profile",
    "title": "Councilperson Sheffield Town Hall",
    "description": "Join Council President Pro Tem Sheffield and the City Assessor for an in depth discussion on Neighborhood Enterprise Zones and what they mean to you!",
    "start": "2019-11-21T18:00:00-0500",
    "end": "2019-11-21T20:00:00-0500",
    "ext_link": "https://detroitmi.gov",
    "image": "https://detroitmi.gov/themes/custom/detroitmi/logo.png",
    "approved": true,
    "location": {
      "id": 2,
      "name": "Metropolitain United Methodist Church",
      "coordinates": null,
      "street_address": "8000 Woodward Ave",
      "street_address_2": null,
      "city": "Detroit",
      "zipcode": "48202",
      "state": "MI"
    }
  },
  {
    "event_id": 3,
    "user_id": 2,
    "organizer_type": "profile",
    "title": "Historic North End Alliance Monthly Meeting",
    "description": "Monthly meeting for the HNEA including a property valuation and tax assessment workshop from Alvin Horhn of the City Assessor's Office!",
    "start": "Tue Oct 22 2019 18:00:00 GMT-0400 (Eastern Daylight Time)",
    "end": "Tue Oct 22 2019 20:00:00 GMT-0400 (Eastern Daylight Time)",
    "ext_link": "https://detroitmi.gov/",
    "image": "https://detroitmi.gov/sites/detroitmi.localhost/files/2018-11/Mary-Sheffield.jpg",
    "approved": false,
    "location": {
      "id": 5,
      "name": "Metropolitain United Methodist Church",
      "coordinates": null,
      "street_address": "8000 Woodward ave",
      "street_address_2": null,
      "city": "Detroit",
      "zipcode": "48202",
      "state": "MI"
    }
  },
  {
    "event_id": 4,
    "user_id": 2,
    "organizer_type": "profile",
    "title": "Detroit People's Food Co-op \"Movie Night\"",
    "description": "Movie Night on Friday, will be an opportunity to purchase ownership into the Co-op. The Co-op will open on Euclid and Woodward. Membership is $200.",
    "start": "Tue Oct 22 2019 18:00:00 GMT-0400 (Eastern Daylight Time)",
    "end": "Tue Oct 22 2019 20:00:00 GMT-0400 (Eastern Daylight Time)",
    "ext_link": "https://detroitmi.gov/",
    "image": "https://detroitmi.gov/sites/detroitmi.localhost/files/2018-11/Mary-Sheffield.jpg",
    "approved": false,
    "location": {
      "id": 6,
      "name": "Metropolitain United Methodist Church",
      "coordinates": null,
      "street_address": "8000 Woodward ave",
      "street_address_2": null,
      "city": "Detroit",
      "zipcode": "48202",
      "state": "MI"
    }
  },
  {
    "event_id": 5,
    "user_id": 2,
    "organizer_type": "profile",
    "title": "North End Fall Harvest Fest",
    "description": "Vanguard CDC presents a free vent especially for children 4-12 years old, but all ages are welcome. There will be a Fire Safety Presentation for children and adults.",
    "start": "Tue Oct 22 2019 18:00:00 GMT-0400 (Eastern Daylight Time)",
    "end": "Tue Oct 22 2019 20:00:00 GMT-0400 (Eastern Daylight Time)",
    "ext_link": "https://detroitmi.gov/",
    "image": "https://detroitmi.gov/sites/detroitmi.localhost/files/2018-11/Mary-Sheffield.jpg",
    "approved": false,
    "location": {
      "id": 7,
      "name": "Metropolitain United Methodist Church",
      "coordinates": null,
      "street_address": "8000 Woodward ave",
      "street_address_2": null,
      "city": "Detroit",
      "zipcode": "48202",
      "state": "MI"
    }
  }
]
""".data(using: .utf8)


let badEventData = """
{
  "iD": 4,
  "organizer_type": "profile",
  "titles": "Test Edit Councilperson Sheffield's Town Hall",
  "description": "Join Council President Pro Tem Sheffield and the City Assessor for an in depth discussion on Neighborhood Enterprise Zones and what they mean to you!",
  "start": "Tue Oct 22 2019 18:00:00 GMT-0400 (Eastern Daylight Time)",
  "end": "Tue Oct 22 2019 20:00:00 GMT-0400 (Eastern Daylight Time)",
  "extLink": "https://detroitmi.gov/",
  "image": "https://detroitmi.gov/sites/detroitmi.localhost/files/2018-11/Mary-Sheffield.jpg",
  "approved": false,
  "user_id": 2,
  "location_id": 9
}
""".data(using: .utf8)

let goodUserData = """
{
  "user_id": 8,
  "username": "testUser11",
  "profile": {
    "id": 8,
    "first_name": "Test",
    "last_name": "User",
    "location_id": 12,
    "location": {
      "id": 12,
      "name": "testUser's House",
      "coordinates": null,
      "street_address": "7432 Brush St",
      "street_address_2": null,
      "city": "Detroit",
      "zipcode": "48202",
      "state": "MI"
    }
  }
}
""".data(using: .utf8)

let badUserData = """
{
  "user_iD": 8,
  "username": "testUser11",
  "profile": {
    "iD": 8,
    "first_name": "Test",
    "last_name": "User",
    "location_id": 12,
    "location": {
      "id": 12,
      "name": "testUser's House",
      "coordinates": null,
      "street_address": "7432 Brush St",
      "street_address_2": null,
      "city": "Detroit",
      "zipcode": "48202",
      "state": "MI"
    }
  }
}
Collapse




Let me know if you need anything else

""".data(using: .utf8)


