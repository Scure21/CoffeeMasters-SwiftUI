//
//  CartManager.swift
//  CoffeeMasters
//
//  Created by Stephanie Cure on 1/22/25.
//

import Foundation

class CartManager: ObservableObject {
    @Published var cart: [(Product, Int)] = []
    
}
