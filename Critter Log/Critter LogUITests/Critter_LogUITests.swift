//
//  Critter_LogUITests.swift
//  Critter LogUITests
//
//  Created by Josh Gdovin on 4/9/23.
//

import XCTest

final class Critter_LogUITests: XCTestCase {

    
    /* -------------------
       Add Critter View Test
     --------------------- */
    class Test_whenAddCritterIsPresented: XCTestCase {
        
        var app: XCUIApplication!
        
        override func setUpWithError() throws {
            app = XCUIApplication()
            app.launch()
            let critterListButton = app.buttons["addCritterButton"]
            critterListButton.tap()

            // In UI tests it is usually best to stop immediately when a failure occurs.
            continueAfterFailure = false
        }
        
        func test_isListScreenDisplayed() {

            let critterListNavBarTitle = app.staticTexts["Add Critter"]
            XCTAssert(critterListNavBarTitle.waitForExistence(timeout: 0.5))
        }

        func test_addCritterContainsTextField() {
            XCTAssertTrue(app.collectionViews["addCritterTextField"].exists)
        }
    }
}
