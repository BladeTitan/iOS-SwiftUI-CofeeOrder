//
//  ContentView.swift
//  CoffeeOrder
//
//  Created by Armand Kamffer on 2020/01/03.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var orderListVM = OrderListViewModel()
    @State private var showModal: Bool = false
    
    var body: some View {
        NavigationView {
            OrderListView(with: orderListVM.orders)
            
                .navigationBarTitle("Coffee Orders")
                .navigationBarItems(leading: Button(action: reloadOrders) {
                    Image(systemName: "arrow.clockwise")
                        .foregroundColor(.white)
                    }, trailing: Button(action: showAddCoffeeOrderView) {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                    })
                
                .sheet(isPresented: self.$showModal, onDismiss: reloadOrders) {
                    AddCoffeeOrderView(isPresented: self.$showModal)
                }
        }
    }
    
    private func reloadOrders() {
        self.orderListVM.fetchOrders()
    }
    
    private func showAddCoffeeOrderView() {
        self.showModal = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
