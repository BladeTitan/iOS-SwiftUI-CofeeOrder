//
//  OrderTotalView.swift
//  CoffeeOrder
//
//  Created by Armand Kamffer on 2020/01/06.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import SwiftUI

struct OrderTotalView: View {
    let total: Double
    
    var body: some View {
        HStack(alignment: .center, spacing: nil) {
            Spacer()
            Text(String(format: "$%.2f", self.total))
                .font(.title)
                .foregroundColor(.green)
            Spacer()
        }.padding(10)
    }
}

struct OrderTotalView_Previews: PreviewProvider {
    static var previews: some View {
        OrderTotalView(total: 45.67)
    }
}
