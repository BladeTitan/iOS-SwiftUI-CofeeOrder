//
//  Order.swift
//  CoffeeOrder
//
//  Created by Armand Kamffer on 2020/01/03.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation

struct Order: Codable {
    let name: String
    let size: String
    let coffeeName: String
    let total: Double
}
