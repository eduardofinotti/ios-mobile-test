//
//  CartHelper.swift
//  ShoppingAppUITests
//
//  Created by Eduardo Finotti on 13/06/19.
//  Copyright © 2019 Shyam Pindoria. All rights reserved.
//

import Foundation
import XCTest

class CartHelper {
    
    class func checkItemDefaultDatailsInCart(app: XCUIApplication, testCase: XCTestCase) {
        testCase.checkOtherElements(app: app, item: ElementReference.cart.tittle)
        testCase.checkText(app: app, item: DataReference.defaultItem.name)
        testCase.checkText(app: app, item: DataReference.defaultItem.price)
        testCase.checkText(app: app, item: DataReference.defaultItem.quantity)
        testCase.checkText(app: app, item: DataReference.defaultItem.finishCart)
        testCase.checkText(app: app, item: DataReference.defaultItem.materialCart)
    }
    
    class func checkSecondItemDatailsInCart(app: XCUIApplication, testCase: XCTestCase) {
        testCase.checkOtherElements(app: app, item: ElementReference.cart.tittle)
        testCase.checkText(app: app, item: DataReference.secondItem.name)
        testCase.checkText(app: app, item: DataReference.secondItem.price)
        testCase.checkText(app: app, item: DataReference.secondItem.quantity)
        testCase.checkText(app: app, item: DataReference.secondItem.finishCart)
        testCase.checkText(app: app, item: DataReference.secondItem.materialCart)
    }
    
    class func checkEmptyCart(app: XCUIApplication, testCase: XCTestCase) {
        testCase.checkOtherElements(app: app, item: ElementReference.cart.tittle)
        testCase.checkText(app: app, item: ElementReference.cart.total)
        testCase.checkText(app: app, item: ElementReference.cart.price)
        testCase.checkButton(app: app, item: ElementReference.cart.checkout)
    }
    
    class func checkPrice(app: XCUIApplication, testCase: XCTestCase, price: String) {
        testCase.checkText(app: app, item: price)
    }
    
    class func deleteItens(app: XCUIApplication, testCase: XCTestCase) {
        
        while app.tables.staticTexts[DataReference.defaultItem.name].exists
            || app.tables.staticTexts[DataReference.secondItem.name].exists {
                
            if app.tables.staticTexts[DataReference.defaultItem.name].exists {
                app.tables.staticTexts[DataReference.defaultItem.name].firstMatch.swipeLeft()
                app.tables.buttons[ElementReference.cart.delete].tap(wait: SessionManager.main.defaultTimeout, test: testCase)
            }
            
            if app.tables.staticTexts[DataReference.secondItem.name].exists{
                app.tables.staticTexts[DataReference.secondItem.name].firstMatch.swipeLeft()
                app.tables.buttons[ElementReference.cart.delete].tap(wait: SessionManager.main.defaultTimeout, test: testCase)
            }
        }
        
    }
    
    class func checkout(app: XCUIApplication, testCase: XCTestCase) {
        app.buttons[ElementReference.cart.checkout].tap(wait: SessionManager.main.defaultTimeout, test: testCase)
    }
    
    
}
