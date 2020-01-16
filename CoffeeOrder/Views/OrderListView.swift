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
                HStack {
                    Image(order.coffeeName)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(16)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text(order.name)
                            .font(.title)
                            .padding([.leading, .bottom], 10)
                        
                        HStack {
                            Text(order.coffeeName)
                                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                                .background(Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                            
                            Text(order.size)
                                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                }
            }
        }
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView(with: [OrderViewModel(with: Order(name: "Armand", size: "Medium", coffeeName: "Regular", total: 3))])
        
    }
}
