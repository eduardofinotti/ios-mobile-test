//
//  SearchHelper.swift
//  ShoppingAppUITests
//
//  Created by Eduardo Finotti on 14/06/19.
//  Copyright © 2019 Shyam Pindoria. All rights reserved.
//

import Foundation
import XCTest

class SearchHelper  {
    
    class func fillSearchItem(app: XCUIApplication, testCase: XCTestCase, item: String) {
        app.searchFields[ElementReference.search.searchItem].fillText(text: item, testCase: testCase)
    }
    
    class func backToMenu(app: XCUIApplication, testCase: XCTestCase) {
        app.buttons[ElementReference.general.menu].tap(wait: SessionManager.main.defaultTimeout, test: testCase)
    }
}
