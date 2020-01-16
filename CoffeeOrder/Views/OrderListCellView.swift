//
//  OrderListCellView.swift
//  CoffeeOrder
//
//  Created by Armand Kamffer on 2020/01/16.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import SwiftUI

struct OrderListCellView: View {
    var order: OrderViewModel
    
    var body: some View {
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

struct OrderListCellView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OrderListCellView(order: OrderViewModel(with: Order(name: "Amy", size: "Medium", coffeeName: "Regular", total: 20)))
                .previewLayout(.sizeThatFits)
                .environment(\.sizeCategory, .extraSmall)
        
            OrderListCellView(order: OrderViewModel(with: Order(name: "Amy", size: "Medium", coffeeName: "Regular", total: 20)))
                .previewLayout(.sizeThatFits)
                .environment(\.sizeCategory, .extraExtraLarge)
            
            OrderListCellView(order: OrderViewModel(with: Order(name: "Amy", size: "Medium", coffeeName: "Regular", total: 20)))
                .previewLayout(.sizeThatFits)
                .colorScheme(.dark)
            
            OrderListCellView(order: OrderViewModel(with: Order(name: "Amy", size: "Medium", coffeeName: "Regular", total: 20)))
                .previewDevice("iPhone XS Max")
                .colorScheme(.dark)
        }
    }
}
