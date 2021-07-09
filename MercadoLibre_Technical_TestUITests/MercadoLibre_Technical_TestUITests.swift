//
//  MercadoLibre_Technical_TestUITests.swift
//  MercadoLibre_Technical_TestUITests
//
//  Created by Christian Camilo Bernal Rojas on 6/07/21.
//

import XCTest

class MercadoLibre_Technical_TestUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSearchProductsByCategory() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        XCUIDevice.shared.orientation = .portrait
        
        let collectionViews = app.collectionViews
        collectionViews.cells.element(boundBy: 3).tap()
        
        let count = app.collectionViews.cells.count
        assert(count > 0)
    }
    
    func testSearchProducts() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let searchField = app.searchFields["Buscar"]
        searchField.tap()
        searchField.typeText("ps5")
        
        app/*@START_MENU_TOKEN@*/.buttons["Search"]/*[[".keyboards",".buttons[\"buscar\"]",".buttons[\"Search\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let count = app.collectionViews.cells.count
        assert(count > 0)
    }
}
