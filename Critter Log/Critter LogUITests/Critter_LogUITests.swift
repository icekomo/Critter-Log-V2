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
    
    /* -------------------
     Load Critters View Test
     --------------------- */
    class Test_loadCritter: XCTestCase {
        
//        func testLoadCritters() throws {
//            let viewModel = CritterViewModel()
//            viewModel.loadCritters()
//            
//            // Assert that the critters array is not empty
//            XCTAssertFalse(viewModel.critters.isEmpty)
//        }
    }
}
