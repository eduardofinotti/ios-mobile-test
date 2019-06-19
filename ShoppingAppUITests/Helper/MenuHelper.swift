//
//  MenuHelper.swift
//  ShoppingAppUITests
//
//  Created by Eduardo Finotti on 13/06/19.
//  Copyright © 2019 Shyam Pindoria. All rights reserved.
//

import Foundation
import XCTest

class MenuHelper {
    
    class func accessList(app: XCUIApplication, testCase: XCTestCase) {
        app.tables.staticTexts[ElementReference.menu.list].tap(wait: SessionManager.main.defaultTimeout, test: testCase)
    }
    
    class func accessCart(app: XCUIApplication, testCase: XCTestCase) {
        app.tables.staticTexts[ElementReference.menu.cart].tap(wait: SessionManager.main.defaultTimeout, test: testCase)
    }

    class func accessSearch(app: XCUIApplication, testCase: XCTestCase) {
        app.tables.staticTexts[ElementReference.menu.search].tap(wait: SessionManager.main.defaultTimeout, test: testCase)
    }
    
    class func accessCheckout(app: XCUIApplication, testCase: XCTestCase) {
        app.tables.staticTexts[ElementReference.menu.checkout].tap(wait: SessionManager.main.defaultTimeout, test: testCase)
    }

}
