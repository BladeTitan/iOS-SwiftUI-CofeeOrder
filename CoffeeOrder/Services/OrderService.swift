//
//  OrderService.swift
//  CoffeeOrder
//
//  Created by Armand Kamffer on 2020/01/03.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation

class OrderService {
    func getAllOrders(completion: @escaping ([Order]?) -> ()) {
        guard let url = URL(string: "https://tricolor-rat.glitch.me/orders") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let orders = try? JSONDecoder().decode([Order].self, from: data)
            DispatchQueue.main.async {
                completion(orders)
            }
        }.resume()
    }
    
    func createCoffeeOrder(order: Order, completion: @escaping (CreateOrderResponse?) -> ()) {
        guard let url = URL(string: "https://tricolor-rat.glitch.me/orders") else {
            completion(nil)
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = try? JSONEncoder().encode(order)
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let response = try? JSONDecoder().decode(CreateOrderResponse.self, from: data)
            DispatchQueue.main.async {
                completion(response)
            }
        }.resume()
    }
}
