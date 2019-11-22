//
//  BlockClubCalenderTests.swift
//  BlockClubCalenderTests
//
//  Created by Jerry haaser on 11/20/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import XCTest
@testable import BlockClubCalender

class BlockClubCalenderTests: XCTestCase {
    
//    var app: XCUIApplication!
//
//    override func setUp() {
//        super.setUp()
//        continueAfterFailure = false
//        app.launch()
//    }

//    func testBaseURL() {
//        let bCCController = CommunityMemberController()
//        
//        XCTAssertEqual("https://home-chore-tracker88.herokuapp.com", "\(choreController.baseURL!)")
//    }

    func testPerformanceExample() {
         if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
                   measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                       XCUIApplication().launch()
                   }
               }
    }
    func testDecodingGoodData() {
        do {
            let dataURL = Bundle.main.url(forResource: "GoodMockData", withExtension: "json")!
            let data = try Data(contentsOf: dataURL)
            let result = try JSONDecoder().decode(EventRepresentation.self, from: data)
            XCTAssertNoThrow(result)
        } catch {
            NSLog("Error")
        }
    }
    func testDecodingBadData() {
        do {
            let badDataURL = Bundle.main.url(forResource: "BadMockData", withExtension: "json")!
            let badData = try Data(contentsOf: badDataURL)
            let badDataResult = try JSONDecoder().decode(EventRepresentation.self, from: badData)
            XCTAssertThrowsError(badDataResult)
        } catch {
            NSLog("Error")
        }
    }
    func testNumberOfSections() {
        let eventsTableViewController = EventsTableViewController()
        let sectionInfo = eventsTableViewController.fetchedResultsController.sections
        let numberOfSections = sectionInfo?.count
        XCTAssertEqual(numberOfSections, 1)
    }
    func testNumberOfRows() {
        let eventsTableViewController = EventsTableViewController()
        let sectionInfo = eventsTableViewController.fetchedResultsController.sections
        let numberOfRows = sectionInfo?.compactMap { $0.numberOfObjects }
        XCTAssertEqual(numberOfRows, [3])
    }

}
