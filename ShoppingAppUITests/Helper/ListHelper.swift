//
//  ListHelper.swift
//  ShoppingAppUITests
//
//  Created by Eduardo Finotti on 13/06/19.
//  Copyright © 2019 Shyam Pindoria. All rights reserved.
//

import Foundation
import XCTest

class ListHelper {
    
    class func chooseItem(app: XCUIApplication, testCase: XCTestCase, item: String) {
        app.collectionViews.staticTexts[item].tap(wait: SessionManager.main.defaultTimeout, test: testCase)
    }
    
    class func backToMenu(app: XCUIApplication, testCase: XCTestCase) {
        app.buttons[ElementReference.general.menu].tap(wait: SessionManager.main.defaultTimeout, test: testCase)
    }
}
