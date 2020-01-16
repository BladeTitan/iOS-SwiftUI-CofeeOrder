//
//  OrderListViewModel.swift
//  CoffeeOrder
//
//  Created by Armand Kamffer on 2020/01/03.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation

class OrderListViewModel: ObservableObject {
    @Published var orders = [OrderViewModel]()
    
    init() {
        fetchOrders()
    }
    
    func fetchOrders() {
        OrderService().getAllOrders { (orders) in
            if let orders = orders {
                self.orders = orders.map { OrderViewModel(with: $0) }
            }
        }
    }
}

