//
//  OrderListView.swift
//  CoffeeOrder
//
//  Created by Armand Kamffer on 2020/01/03.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import SwiftUI

struct OrderListView: View {
    let orders: [OrderViewModel]
    
    init(with orders: [OrderViewModel]) {
        self.orders = orders
    }
    
    var body: some View {
        List {
            ForEach(self.orders, id: \.id) { order in
                OrderListCellView(order: order)
            }
        }
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView(with: [OrderViewModel(with: Order(name: "Armand", size: "Medium", coffeeName: "Regular", total: 3))])
    }
}

