//
//  OrderViewModel.swift
//  CoffeeOrder
//
//  Created by Armand Kamffer on 2020/01/03.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation

class OrderViewModel: Identifiable {
    let id = UUID()
    
    var order: Order
    
    init(with order: Order) {
        self.order = order
    }
    
    var name: String {
        self.order.name
    }
    
    var size: String {
        self.order.size
    }
    
    var coffeeName: String {
        self.order.coffeeName
    }
    
    var total: Double {
        self.order.total
    }
}
