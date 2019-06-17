//
//  XCUIElementExtensions.swift
//  ShoppingAppUITests
//
//  Created by Eduardo Finotti on 13/06/19.
//  Copyright © 2019 Shyam Pindoria. All rights reserved.
//

import Foundation
import XCTest

extension XCUIElement {

    func tap(wait: Int, test: XCTestCase) {
        if !isHittable {
            test.expectation(for: NSPredicate(format: "hittable == true"), evaluatedWith: self, handler: nil);
            test.waitForExpectations(timeout: TimeInterval(wait), handler: nil)
        }
        tap()
    }

    func fillText(text: String, testCase: XCTestCase) {
        tap(wait: 20, test: testCase)
        typeText(text)
    }
}
