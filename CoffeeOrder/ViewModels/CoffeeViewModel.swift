//
//  CoffeeViewModel.swift
//  CoffeeOrder
//
//  Created by Armand Kamffer on 2020/01/06.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation

class CoffeeListViewModel {
    var coffeeList: [CoffeeViewModel] = [CoffeeViewModel]()
}

class CoffeeViewModel {
    var coffee: Coffee
    
    init(with coffee: Coffee) {
        self.coffee = coffee
    }
    
    var name: String {
        return self.coffee.name
    }
    
    var imageURL: String {
        return self.coffee.imageURL
    }
    
    var price: Double {
        return self.coffee.price
    }
}
