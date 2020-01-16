//
//  AddCoffeeOrderView.swift
//  CoffeeOrder
//
//  Created by Armand Kamffer on 2020/01/06.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import SwiftUI

struct AddCoffeeOrderView: View {
    func addCoffeeOrder() {
        
    }
    
    @Binding var isPresented: Bool
    @ObservedObject private var addCoffeeOrderVM = AddCoffeeOrderViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("INFORMATION").font(.body)) {
                        TextField("Enter your name", text: self.$addCoffeeOrderVM.name)
                    }
                    
                    Section(header: Text("SELECT COFFEE").font(.body)) {
                        ForEach(self.addCoffeeOrderVM.coffeeList, id: \.name) { coffee in
                            CoffeeCellView(coffee: coffee, selection: self.$addCoffeeOrderVM.coffeeName)
                        }
                    }
                    
                    Section(header: Text("SELECT COFFEE").font(.body), footer: OrderTotalView(total: self.addCoffeeOrderVM.total)) {
                        Picker("", selection: self.$addCoffeeOrderVM.size) {
                            Text("Small").tag("Small")
                            Text("Medium").tag("Medium")
                            Text("Large").tag("Large")
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                }
                
                HStack(alignment: .center, spacing: nil) {
                    Button("Place Order") {
                        self.addCoffeeOrderVM.placeOrder()
                        self.isPresented = false
                    }
                }.padding(EdgeInsets(top: 12, leading: 100, bottom: 12, trailing: 100))
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .navigationBarTitle("Add Order")
        }
    }
}

struct AddCoffeeOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddCoffeeOrderView(isPresented: .constant(false))
    }
}

struct CoffeeCellView: View {
    let coffee: CoffeeViewModel
    @Binding var selection: String
    
    var body: some View {
        HStack {
            Image(coffee.imageURL)
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
                .cornerRadius(16)
            Text(coffee.name)
                .font(.title)
                .padding([.leading], 20)
            Spacer()
            Image(systemName: self.selection == self.coffee.name ? "checkmark": "").padding()
        }.onTapGesture {
            self.selection = self.coffee.name
        }
    }
}
