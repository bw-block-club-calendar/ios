//
//  BlockClubCalenderUITests.swift
//  BlockClubCalenderUITests
//
//  Created by Jerry haaser on 11/21/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import XCTest
@testable import BlockClubCalender

class BlockClubCalenderUITests: XCTestCase {
    
    let app = XCUIApplication()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
    func testTabBarButtons() {

        let tabBarsQuery = XCUIApplication().tabBars
        let profileButton = tabBarsQuery.buttons["Profile"]
        profileButton.tap()
        XCTAssertNotNil(app.buttons["SignInButton"])

        let eventsButton = tabBarsQuery.buttons["Events"]
        eventsButton.tap()
        let eventsStaticText = app.navigationBars["Events"].staticTexts["Events"]
        XCTAssertNotNil(eventsStaticText)

    }
    func testLogIn() {
        let signinbuttonButton = app/*@START_MENU_TOKEN@*/.buttons["SignInButton"]/*[[".buttons[\"Sign in\"]",".buttons[\"SignInButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        signinbuttonButton.tap()
        app.textFields["username"].tap()
        let passwordTextField = app.textFields["password"]
        passwordTextField.tap()
        passwordTextField.tap()
        app.buttons["Login"].tap()
    }
    func testSignUp() {
        let usernameTextField = app.textFields["username"]
        usernameTextField.tap()
        let passwordTextField = app.textFields["password"]
        passwordTextField.tap()
        passwordTextField.tap()
        app.buttons["Signup"].tap()
        let nameTextField = app.textFields["name"]
        nameTextField.tap()
        nameTextField.tap()
        let emailTextField = app.textFields["email"]
        emailTextField.tap()
        emailTextField.tap()
        let cityTextField = app.textFields["city"]
        cityTextField.tap()
        cityTextField.tap()
        usernameTextField.tap()
        usernameTextField.tap()
        passwordTextField.tap()
        passwordTextField.tap()
        let yesButton = app/*@START_MENU_TOKEN@*/.buttons["yes"]/*[[".segmentedControls.buttons[\"yes\"]",".buttons[\"yes\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        yesButton.tap()
        let app2 = app
        app2/*@START_MENU_TOKEN@*/.buttons["no"]/*[[".segmentedControls.buttons[\"no\"]",".buttons[\"no\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        yesButton.tap()
        app2/*@START_MENU_TOKEN@*/.staticTexts["Done"]/*[[".buttons[\"Done\"].staticTexts[\"Done\"]",".staticTexts[\"Done\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["Login"].tap()
    }
    func testAddEventTitleTextfield() {
        let app = XCUIApplication()
        app.tabBars.buttons["Events"].tap()
        app.navigationBars["Events"].buttons["Add"].tap()
        app.textFields["AddEventViewController.TitleTextfield"].tap()
        app.textFields["AddEventViewController.TitleTextfield"].typeText("Test Event")
        XCTAssertNotEqual(app.textFields["AddEventViewController.TitleTextfield"].value as? String, "")
//        app.navigationBars["BlockClubCalender.AddEventView"].buttons["Save"].tap()

    }
    func testAddEventAddressTextfield() {
        let app = XCUIApplication()
        app.tabBars.buttons["Events"].tap()
        app.navigationBars["Events"].buttons["Add"].tap()
        app.textFields["AddEventViewController.addressTextfield"].tap()
        app.textFields["AddEventViewController.addressTextfield"].typeText("Test Event Address")
        XCTAssertNotEqual(app.textFields["AddEventViewController.addressTextfield"].value as? String, "")
    }
    func testAddEventDateTextfield() {
        let app = XCUIApplication()
               app.tabBars.buttons["Events"].tap()
               app.navigationBars["Events"].buttons["Add"].tap()
        app.textFields["addEventViewController.dateTextfield"].tap()
        app.textFields["addEventViewController.dateTextfield"].typeText("Test Event date")
        XCTAssertNotEqual(app.textFields["addEventViewController.dateTextfield"].value as? String, "")
    }
    func testAddEventDescriptionTextview() {
        let app = XCUIApplication()
        app.tabBars.buttons["Events"].tap()
        app.navigationBars["Events"].buttons["Add"].tap()
        app.textViews["DescriptionTextview"].tap()
        app.textViews["DescriptionTextview"].typeText("Test Event description")
        XCTAssertNotEqual(app.textViews["DescriptionTextview"].value as? String, "")
    }
    func testLookingAtEvent() {

        let app = XCUIApplication()
        app.tabBars.buttons["Events"].tap()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["new event"]/*[[".cells.staticTexts[\"new event\"]",".staticTexts[\"new event\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()

        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element.tap()
        element.swipeDown()

    }
//    func testDeletingAnEvent() {
//
//        let app = XCUIApplication()
//        let tabBarsQuery = app.tabBars
//        tabBarsQuery.buttons["Profile"].tap()
//        tabBarsQuery.buttons["Events"].tap()
//        app.tables/*@START_MENU_TOKEN@*/.staticTexts["new event"]/*[[".cells.staticTexts[\"new event\"]",".staticTexts[\"new event\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeLeft()
//        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element/*@START_MENU_TOKEN@*/.swipeRight()/*[[".swipeDown()",".swipeRight()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//
//    }
}
