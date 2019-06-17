//
//  ShoppingAppUITests.swift
//  ShoppingAppUITests
//
//  Created by Eduardo Finotti on 13/06/19.
//  Copyright © 2019 Shyam Pindoria. All rights reserved.
//

import XCTest

class ShoppingAppUITests: XCTestCase {
    
    let app = XCUIApplication()
    let defaultTimeout = 20
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        tapNotification()
        app.launch()
        
        MenuHelper.accessCart(app: app, testCase: self)
        CartHelper.deleteItens(app: app, testCase: self)
        ListHelper.backToMenu(app: app, testCase: self)
    }

    override func tearDown() {}

    // Add and remove an item from the cart
    func testAddAndRemoveItemFromCart() {
        MenuHelper.accessList(app: app, testCase: self)
        ListHelper.chooseItem(app: app, testCase: self, item: DataReference.defaultItem.name)
        ItemHelper.checkItemDefaultDatails(app: app, testCase: self)
        ItemHelper.addToCard(app: app, testCase: self)
        ItemHelper.backToList(app: app, testCase: self)
        ListHelper.backToMenu(app: app, testCase: self)
        MenuHelper.accessCart(app: app, testCase: self)
        CartHelper.checkItemDefaultDatailsInCart(app: app, testCase: self)
        CartHelper.deleteItens(app: app, testCase: self)
        CartHelper.checkEmptyCart(app: app, testCase: self)
    }
    
    // Browse and buy an item with success at lease 2 different itens
    func testBuyTwoDifferentItensWithSuccess() {
        MenuHelper.accessSearch(app: app, testCase: self)
        SearchHelper.fillSearchItem(app: app, testCase: self, item: DataReference.secondItem.name)
        ListHelper.chooseItem(app: app, testCase: self, item: DataReference.secondItem.name)
        ItemHelper.checkSecondItemDatails(app: app, testCase: self)
        ItemHelper.addToCard(app: app, testCase: self)
        ItemHelper.backToSearch(app: app, testCase: self)
        SearchHelper.backToMenu(app: app, testCase: self)
        MenuHelper.accessSearch(app: app, testCase: self)
        SearchHelper.fillSearchItem(app: app, testCase: self, item: DataReference.defaultItem.name)
        ListHelper.chooseItem(app: app, testCase: self, item: DataReference.defaultItem.name)
        ItemHelper.checkItemDefaultDatails(app: app, testCase: self)
        ItemHelper.addToCard(app: app, testCase: self)
        ItemHelper.backToSearch(app: app, testCase: self)
        SearchHelper.backToMenu(app: app, testCase: self)
        MenuHelper.accessCart(app: app, testCase: self)
        CartHelper.checkItemDefaultDatailsInCart(app: app, testCase: self)
        CartHelper.checkSecondItemDatailsInCart(app: app, testCase: self)
        CartHelper.checkPrice(app: app, testCase: self, price: DataReference.defaultItem.price)
        CartHelper.checkout(app: app, testCase: self)
        CheckoutHelper.fillCreditCard(app: app, testCase: self)
        CheckoutHelper.checkCheckoutTwoItens(app: app, testCase: self)
        CheckoutHelper.payNow(app: app, testCase: self)
        CheckoutHelper.checkCheckoutSuccess(app: app, testCase: self)
    }
    
    // Browse trough the search and buy one item changing the default Finish and Material and quantity in a different address.
    func testSearchAndBuyItemWithOtherDefaultFinishMaterialQuantityInDifferentAddress() {
        MenuHelper.accessSearch(app: app, testCase: self)
        SearchHelper.fillSearchItem(app: app, testCase: self, item: DataReference.defaultItem.name)
        ListHelper.chooseItem(app: app, testCase: self, item: DataReference.defaultItem.name)
        ItemHelper.checkItemDefaultDatails(app: app, testCase: self)
        ItemHelper.changeDefaultFinish(app: app, testCase: self, finish: DataReference.dataChange.finish)
        ItemHelper.changeMaterial(app: app, testCase: self, material:  DataReference.dataChange.material)
        ItemHelper.addQuantity(app: app, testCase: self)
        ItemHelper.addToCard(app: app, testCase: self)
        ItemHelper.checkItemDefaultDatails(app: app, testCase: self)
        ItemHelper.accessCart(app: app, testCase: self, item: DataReference.defaultItem.name)
        CartHelper.checkItemDefaultDatailsInCart(app: app, testCase: self)
        CartHelper.checkout(app: app, testCase: self)
        CheckoutHelper.fillCreditCard(app: app, testCase: self)
        CheckoutHelper.changeAddress(app: app, testCase: self)
        CheckoutHelper.checkCheckoutOneItem(app: app, testCase: self)
        CheckoutHelper.payNow(app: app, testCase: self)
        CheckoutHelper.checkCheckoutSuccess(app: app, testCase: self)
    }

}
