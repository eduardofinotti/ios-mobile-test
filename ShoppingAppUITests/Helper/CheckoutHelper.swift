//
//  CheckoutHelper.swift
//  ShoppingAppUITests
//
//  Created by Eduardo Finotti on 14/06/19.
//  Copyright © 2019 Shyam Pindoria. All rights reserved.
//

import Foundation
import XCTest

class CheckoutHelper: XCTestCase  {
    
    class func fillCreditCard(app: XCUIApplication, testCase: XCTestCase) {
        app.textFields[ElementReference.checkout.card].fillText(text: DataReference.checkout.card, testCase: testCase)
        app.textFields[ElementReference.checkout.mounth].fillText(text: DataReference.checkout.mounth, testCase: testCase)
        app.textFields[ElementReference.checkout.year].fillText(text: DataReference.checkout.year, testCase: testCase)
        app.textFields[ElementReference.checkout.cvv].fillText(text: DataReference.checkout.cvv, testCase: testCase)
    }
    
    class func changeAddress(app: XCUIApplication, testCase: XCTestCase) {
        app.scrollViews.otherElements.pickerWheels[DataReference.checkout.address].swipeUp()
    }
    
    class func payNow(app: XCUIApplication, testCase: XCTestCase) {
        app.buttons[ElementReference.checkout.payNow].tap(wait: SessionManager.main.defaultTimeout, test: testCase)
        
    }
    
    class func confirmPayment(app: XCUIApplication, testCase: XCTestCase) {
        app.sheets["Confirm Purchase"].buttons[ElementReference.checkout.pay].tap(wait: SessionManager.main.defaultTimeout, test: testCase)
    }
    
    class func checkCheckoutTwoItens(app: XCUIApplication, testCase: XCTestCase) {
        testCase.checkOtherElements(app: app, item: ElementReference.checkout.tittle)
        testCase.checkText(app: app, item: "Card Details")
        testCase.checkText(app: app, item: "Scout's Gun")
        testCase.checkText(app: app, item: "1 x $98.00")
        testCase.checkText(app: app, item: "D.Va Headset")
        testCase.checkText(app: app, item: "1 x $60.00")
        testCase.checkText(app: app, item: "$158.00")
    }
    
    class func checkCheckoutOneItem(app: XCUIApplication, testCase: XCTestCase) {
        testCase.checkOtherElements(app: app, item: ElementReference.checkout.tittle)
        testCase.checkText(app: app, item: "Card Details")
        testCase.checkText(app: app, item: "D.Va Headset")
        testCase.checkText(app: app, item: "2 x $198.00")
        testCase.checkText(app: app, item: "$198.00")
    }
    
    class func checkCheckoutSuccess(app: XCUIApplication, testCase: XCTestCase) {
        testCase.checkText(app: app, item: ElementReference.checkout.thanksMEssage)
        testCase.checkText(app: app, item: ElementReference.checkout.orderMessage)
        testCase.checkButton(app: app, item: ElementReference.checkout.keepShopping)
    }
    
    class func checkEmptyCheckout(app: XCUIApplication, testCase: XCTestCase) {
        testCase.checkText(app: app, item: ElementReference.checkout.priceZero)
    }
    
    class func checkMessageEmptyCheckout(app: XCUIApplication, testCase: XCTestCase) {
        testCase.checkAlert(app: app, context: "Error", item: "Error")
        testCase.checkAlert(app: app, context: "Error", item: "Your cart is empty.")
        app.alerts["Error"].buttons["Okay"].tap(wait: SessionManager.main.defaultTimeout, test: testCase)
    }
    
}
