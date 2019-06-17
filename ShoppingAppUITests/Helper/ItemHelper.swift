//
//  ItemHelper.swift
//  ShoppingAppUITests
//
//  Created by Eduardo Finotti on 13/06/19.
//  Copyright © 2019 Shyam Pindoria. All rights reserved.
//

import Foundation
import XCTest

class ItemHelper: XCTestCase  {
    
    class func checkItemDefaultDatails(app: XCUIApplication, testCase: XCTestCase) {
        testCase.checkText(app: app, item: DataReference.defaultItem.name)
        testCase.checkText(app: app, item: DataReference.defaultItem.price)
        testCase.checkText(app: app, item: DataReference.defaultItem.description)
        testCase.checkText(app: app, item: DataReference.defaultItem.category)
        testCase.checkText(app: app, item: DataReference.defaultItem.quantity)
        
        XCTAssertTrue(app.segmentedControls.buttons[DataReference.defaultItem.finish].isSelected)
        XCTAssertTrue(app.segmentedControls.buttons[DataReference.defaultItem.material].isSelected)
    }
    
    class func checkSecondItemDatails(app: XCUIApplication, testCase: XCTestCase) {
        testCase.checkText(app: app, item: DataReference.secondItem.name)
        testCase.checkText(app: app, item: DataReference.secondItem.price)
        testCase.checkText(app: app, item: DataReference.secondItem.description)
        testCase.checkText(app: app, item: DataReference.secondItem.category)
        testCase.checkText(app: app, item: DataReference.secondItem.quantity)
        
        XCTAssertTrue(app.segmentedControls.buttons[DataReference.secondItem.finish].isSelected)
        XCTAssertTrue(app.segmentedControls.buttons[DataReference.secondItem.material].isSelected)
    }
    
    class func addToCard(app: XCUIApplication, testCase: XCTestCase) {
        app.buttons[ElementReference.item.addCard].tap(wait: SessionManager.main.defaultTimeout, test: testCase)
        testCase.checkText(app: app, item: ElementReference.item.success)
    }
    
    class func backToList(app: XCUIApplication, testCase: XCTestCase) {
        app.buttons[ElementReference.general.list].tap(wait: SessionManager.main.defaultTimeout, test: testCase)
    }
    
    class func backToSearch(app: XCUIApplication, testCase: XCTestCase) {
        app.buttons[ElementReference.general.search].tap(wait: SessionManager.main.defaultTimeout, test: testCase)
    }
    
    class func accessCart(app: XCUIApplication, testCase: XCTestCase, item: String) {
        app.navigationBars[item].children(matching: .button).element(boundBy: 1).tap()
    }
    
    class func changeDefaultFinish(app: XCUIApplication, testCase: XCTestCase, finish: String) {
        app.segmentedControls.buttons[finish].tap(wait: SessionManager.main.defaultTimeout, test: testCase)

        if finish == "Painting"{
            DataReference.defaultItem.finishCart = "Finish: Paint"
        }
        
        if finish == "No Painting"{
            DataReference.defaultItem.finishCart = "Finish: No Paint"
        }
        
        DataReference.defaultItem.finish = finish
        changePrice(app: app, testCase: testCase)
    }
    
    class func changeMaterial(app: XCUIApplication, testCase: XCTestCase, material: String) {
        app.segmentedControls.buttons[material].tap(wait: SessionManager.main.defaultTimeout, test: testCase)
        DataReference.defaultItem.materialCart = "Material " + material
        DataReference.defaultItem.material = material
        changePrice(app: app, testCase: testCase)
    }
    
    class func changePrice(app: XCUIApplication, testCase: XCTestCase) {
        
        if app.segmentedControls.buttons["No Painting"].isSelected
            && app.segmentedControls.buttons["PLA"].isSelected{
            DataReference.defaultItem.price = "$60.00"
        }
        
        if app.segmentedControls.buttons["No Painting"].isSelected
            && app.segmentedControls.buttons["ABS"].isSelected{
            DataReference.defaultItem.price = "$66.00"
        }
        
        if app.segmentedControls.buttons["Painting"].isSelected
            && app.segmentedControls.buttons["PLA"].isSelected{
            DataReference.defaultItem.price = "$93.00"
        }
        
        if app.segmentedControls.buttons["Painting"].isSelected
            && app.segmentedControls.buttons["ABS"].isSelected{
            DataReference.defaultItem.price = "$99.00"
        }
        
    }
    
    class func addQuantity(app: XCUIApplication, testCase: XCTestCase) {
        app/*@START_MENU_TOKEN@*/.steppers/*[[".scrollViews.steppers",".steppers"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.buttons[ElementReference.item.addItem].tap(wait: SessionManager.main.defaultTimeout, test: testCase)
        DataReference.defaultItem.quantity = "Quantity: 2"
        DataReference.defaultItem.price = "$198.00"
    }
    
    
    
}
