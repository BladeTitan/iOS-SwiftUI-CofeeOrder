//
//  Coffee.swift
//  CoffeeOrder
//
//  Created by Armand Kamffer on 2020/01/03.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation

struct Coffee: Codable {
    let name: String
    let imageURL: String
    let price: Double
    
    static func all() -> [Coffee] {
        return [
            Coffee(name: "Cappuccino", imageURL: "Cappuccino", price: 20),
            Coffee(name: "Regular", imageURL: "Regular", price: 20),
            Coffee(name: "Americano", imageURL: "Americano", price: 15)
        ]
    }
}
