//
//  DataReference.swift
//  ShoppingAppUITests
//
//  Created by Eduardo Finotti on 13/06/19.
//  Copyright © 2019 Shyam Pindoria. All rights reserved.
//

import Foundation
enum DataReference {
    
    enum defaultItem {
        static var name = "D.Va Headset"
        static var price = "$60.00"
        static var description = "A headset as worn by Hana Song in Overwatch"
        static var category = "Category: Overwatch"
        static var quantity = "Quantity: 1"
        static var finish = "No Painting"
        static var material = "PLA"
        
        static var finishCart = "Finish: No Paint"
        static var materialCart = "Material: PLA"
    }
    
    enum secondItem {
        static var name = "Scout's Gun"
        static var price = "$98.00"
        static var description = "The gun used by Scout in Team Fortress 2"
        static var category = "Category: TF2, Team Fortress 2"
        static var quantity = "Quantity: 1"
        static var finish = "No Painting"
        static var material = "PLA"
        
        static var finishCart = "Finish: No Paint"
        static var materialCart = "Material: PLA"
    }
    
    enum dataChange {
        static var finish = "Painting"
        static var material = "ABS"
    }
    
    enum checkout {
        static let card = "5555 5555 5555 5555"
        static let mounth = "05"
        static let year = "2020"
        static let cvv = "150"
        static let address = "939 Marion Rd, Mitchell Park"
    }
    
}
