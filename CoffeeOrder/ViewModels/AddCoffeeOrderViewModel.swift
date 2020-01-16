//
//  AddCoffeeOrderViewModel.swift
//  CoffeeOrder
//
//  Created by Armand Kamffer on 2020/01/03.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation

class AddCoffeeOrderViewModel: ObservableObject {
    private var orderService: OrderService
    
    var name: String = ""
    @Published var size: String = "Medium"
    @Published var coffeeName: String = ""
    
    var coffeeList: [CoffeeViewModel] {
        return Coffee.all().map({CoffeeViewModel(with: $0)})
    }
    
    init() {
        orderService = OrderService()
    }
    
    var total: Double {
        return totalPrice()
    }
    
    func placeOrder() {
        let order = Order(name: self.name, size: self.size, coffeeName: self.coffeeName, total: self.total)
        
        orderService.createCoffeeOrder(order: order) { _ in
            
        }
    }
    
    private func totalPrice() -> Double {
        if let coffeeVM = coffeeList.first(where: {$0.name == coffeeName}) {
            return coffeeVM.price + priceForSize()
        } else {
            return 0
        }
    }
    
    private func priceForSize() -> Double {
        let prices = ["Small": 2.0, "Medium": 3.0, "Large": 4.0]
        return prices[self.size] ?? 0
    }
}
