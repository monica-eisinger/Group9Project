//
//  UITesting.swift
//  UITesting
//
//  Created by Riley Dickens on 4/7/19.
//  Copyright © 2019 *. All rights reserved.
//

import XCTest

class UITesting: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testImageExists() {
        let picture = app.images["sick"]
        XCTAssertTrue(picture.exists)
    }
    
    func testSymptomsAppear(){
        app.buttons["Start Search"].tap()
        
        let app = XCUIApplication()
        app.otherElements.containing(.navigationBar, identifier:"SickoSearch.View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element.tap()
        app.otherElements.containing(.navigationBar, identifier:"SickoSearch.View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element.typeText("shor")
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["shortness of breath"]/*[[".cells.staticTexts[\"shortness of breath\"]",".staticTexts[\"shortness of breath\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertTrue(app.staticTexts["shortness of breath"].exists)
        
    }
    
    func testClearSearch(){
        app.buttons["Start Search"].tap()
        app.otherElements.containing(.navigationBar, identifier:"SickoSearch.View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element.tap()
        app.otherElements.containing(.navigationBar, identifier:"SickoSearch.View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element.typeText("shor")
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["shortness of breath"]/*[[".cells.staticTexts[\"shortness of breath\"]",".staticTexts[\"shortness of breath\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.otherElements.containing(.navigationBar, identifier:"SickoSearch.View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element.tap()
        app.otherElements.containing(.navigationBar, identifier:"SickoSearch.View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element.typeText("pai")
        app.tables.staticTexts["pain chest"].tap()
        app.otherElements.containing(.navigationBar, identifier:"SickoSearch.View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element.tap()
        app.otherElements.containing(.navigationBar, identifier:"SickoSearch.View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element.typeText("snee")
        app.tables.staticTexts["sneeze"].tap()
        app.otherElements.containing(.navigationBar, identifier:"SickoSearch.View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element.tap()
        app.otherElements.containing(.navigationBar, identifier:"SickoSearch.View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element.typeText("fev")
        app.tables.staticTexts["fever"].tap()
        app.otherElements.containing(.navigationBar, identifier:"SickoSearch.View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element.tap()
        app.otherElements.containing(.navigationBar, identifier:"SickoSearch.View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element.typeText("slee")
        app.tables.staticTexts["sleeplessness"].tap()
        app.otherElements.containing(.navigationBar, identifier:"SickoSearch.View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element.tap()
        app.otherElements.containing(.navigationBar, identifier:"SickoSearch.View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element.typeText("ramb")
        app.tables.staticTexts["rambling speech"].tap()
        app.otherElements.containing(.navigationBar, identifier:"SickoSearch.View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element.tap()
        app.otherElements.containing(.navigationBar, identifier:"SickoSearch.View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element.typeText("uns")
        app.tables.staticTexts["unsteady gait"].tap()
        app.otherElements.containing(.navigationBar, identifier:"SickoSearch.View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element.tap()
        app.otherElements.containing(.navigationBar, identifier:"SickoSearch.View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element.typeText("swea")
        app.tables.staticTexts["sweat"].tap()
        app.otherElements.containing(.navigationBar, identifier:"SickoSearch.View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element.tap()
        app.otherElements.containing(.navigationBar, identifier:"SickoSearch.View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element.typeText("dizzi")
        app.tables.staticTexts["dizziness"].tap()
        app.otherElements.containing(.navigationBar, identifier:"SickoSearch.View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element.tap()
        app.otherElements.containing(.navigationBar, identifier:"SickoSearch.View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element.typeText("sore")
        app.tables.staticTexts["sore to touch"].tap()
        app.buttons["Clear search values"].tap()
        
        XCTAssertFalse(app.staticTexts["shortness of breath"].exists)
        XCTAssertFalse(app.staticTexts["pain chest"].exists)
        XCTAssertFalse(app.staticTexts["sweat"].exists)
        XCTAssertFalse(app.staticTexts["dizziness"].exists)
        XCTAssertFalse(app.staticTexts["sore to touch"].exists)
        XCTAssertFalse(app.staticTexts["unsteady gait"].exists)
        XCTAssertFalse(app.staticTexts["rambling speech"].exists)
        XCTAssertFalse(app.staticTexts["sleeplessness"].exists)
        XCTAssertFalse(app.staticTexts["fever"].exists)
        XCTAssertFalse(app.staticTexts["sneeze"].exists)
        
    }
    
    func testDiseasesAppear(){
        app.buttons["Start Search"].tap()
        app.otherElements.containing(.navigationBar, identifier:"SickoSearch.View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element.tap()
        app.otherElements.containing(.navigationBar, identifier:"SickoSearch.View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element.typeText("shor")
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["shortness of breath"]/*[[".cells.staticTexts[\"shortness of breath\"]",".staticTexts[\"shortness of breath\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.otherElements.containing(.navigationBar, identifier:"SickoSearch.View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element.tap()
        app.otherElements.containing(.navigationBar, identifier:"SickoSearch.View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element.typeText("pai")
        app.tables.staticTexts["pain chest"].tap()
        app.otherElements.containing(.navigationBar, identifier:"SickoSearch.View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element.tap()
        app.otherElements.containing(.navigationBar, identifier:"SickoSearch.View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element.typeText("snee")
        app.tables.staticTexts["sneeze"].tap()
        app.buttons["Start Search"].tap()
        XCTAssertFalse(app.staticTexts["none"].exists)
        
        
        
    }
    
    func testDistancesAppear() {
        app.buttons["Start Search"].tap()
        app.otherElements.containing(.navigationBar, identifier:"SickoSearch.View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element.tap()
        app.otherElements.containing(.navigationBar, identifier:"SickoSearch.View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element.typeText("shor")
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["shortness of breath"]/*[[".cells.staticTexts[\"shortness of breath\"]",".staticTexts[\"shortness of breath\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.otherElements.containing(.navigationBar, identifier:"SickoSearch.View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element.tap()
        app.otherElements.containing(.navigationBar, identifier:"SickoSearch.View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element.typeText("pai")
        app.tables.staticTexts["pain chest"].tap()
        app.otherElements.containing(.navigationBar, identifier:"SickoSearch.View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element.tap()
        app.otherElements.containing(.navigationBar, identifier:"SickoSearch.View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element.typeText("snee")
        app.tables.staticTexts["sneeze"].tap()
        app.buttons["Start Search"].tap()
        let element = app.otherElements.containing(.navigationBar, identifier:"SickoSearch.View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element.children(matching: .button).element(boundBy: 0).tap()
        
        XCTAssertTrue(app.buttons["5 miles"].exists)
    }
    
    func testDoctorsAppear(){
        app.buttons["Start Search"].tap()
        app.otherElements.containing(.navigationBar, identifier:"SickoSearch.View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element.tap()
        app.otherElements.containing(.navigationBar, identifier:"SickoSearch.View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element.typeText("shor")
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["shortness of breath"]/*[[".cells.staticTexts[\"shortness of breath\"]",".staticTexts[\"shortness of breath\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.otherElements.containing(.navigationBar, identifier:"SickoSearch.View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element.tap()
        app.otherElements.containing(.navigationBar, identifier:"SickoSearch.View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element.typeText("pai")
        app.tables.staticTexts["pain chest"].tap()
        app.otherElements.containing(.navigationBar, identifier:"SickoSearch.View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element.tap()
        app.otherElements.containing(.navigationBar, identifier:"SickoSearch.View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element.typeText("snee")
        app.tables.staticTexts["sneeze"].tap()
        app.buttons["Start Search"].tap()
        let element = app.otherElements.containing(.navigationBar, identifier:"SickoSearch.View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element.children(matching: .button).element(boundBy: 2).tap()
        app.buttons["5 miles"].tap()
        XCTAssertFalse(app.tables.staticTexts["none"].exists)
        
    }
    
    
}
