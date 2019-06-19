//
//  XCTestCaseExtensions.swift
//  ShoppingAppUITests
//
//  Created by Eduardo Finotti on 13/06/19.
//  Copyright © 2019 Shyam Pindoria. All rights reserved.
//

import Foundation
import XCTest

extension XCTestCase {
    func tapNotification() {
        
        addUIInterruptionMonitor(withDescription: "Allow “Shopping App” to access your location while you are using the app?") { (alerts) -> Bool in
            
            if(alerts.buttons["Allow"].exists){
                alerts.buttons["Allow"].tap();
            }
            
            return true;
        }
    }
    
    func checkText(app: XCUIApplication, item: String) {
        XCTAssertTrue(app.staticTexts[item]
            .waitForExistence(timeout: TimeInterval(SessionManager.main.defaultTimeout)))
    }
    
    func checkOtherElements(app: XCUIApplication, item: String) {
        XCTAssertTrue(app.otherElements[item]
            .waitForExistence(timeout: TimeInterval(SessionManager.main.defaultTimeout)))
    }
    
    func checkButton(app: XCUIApplication, item: String) {
        XCTAssertTrue(app.buttons[item]
            .waitForExistence(timeout: TimeInterval(SessionManager.main.defaultTimeout)))
    }
    
    func checkAlert(app: XCUIApplication, context: String, item: String) {
        XCTAssertTrue(app.alerts[context].staticTexts[item]
            .waitForExistence(timeout: TimeInterval(SessionManager.main.defaultTimeout)))
    }
    
}

extension XCUIApplication {
    func hideKeyboard(){
        XCUIApplication().toolbars["Toolbar"].buttons["Done"].tap()
    }
}
