//
//  AgifyAppUITests.swift
//  AgifyAppUITests
//
//  Created by Amr Omran on 25.02.25.
//

import XCTest

final class AgifyAppUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor
    func testSearchButton() throws {
        let app = XCUIApplication()
        app.launch()
        
        let button = app.buttons["Find your age"]
        button.tap()
        
        let textField = app.textFields["Your name..."]
        XCTAssertTrue(textField.exists, "TextField should be visible")
        
        let searchButton = app.buttons["search_button"]
        XCTAssertTrue(searchButton.exists, "Search Button should be visible")
        XCTAssertFalse(searchButton.isEnabled, "Search Button should not be enabled if the TextField is empty")
        
        
        textField.tap()
        textField.typeText("J")
        textField.typeText("o")
        textField.typeText("h")
        textField.typeText("n")
        
        XCTAssertTrue(searchButton.isEnabled, "Search Button should be enabled")
        
        textField.tap()
        textField.typeText("")
        
        let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: 4)
        textField.typeText(deleteString)
        
        XCTAssertFalse(searchButton.isEnabled, "Search Button should be again not enabled")
    }
    
    
    @MainActor
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
