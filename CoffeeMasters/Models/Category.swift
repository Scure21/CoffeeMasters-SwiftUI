//
//  Category.swift
//  CoffeeMasters
//
//  Created by Stephanie Cure on 1/22/25.
//

import Foundation

struct Category: Decodable, Identifiable {
    var name: String
    var products: [Product] = []
    var id: String {
        return self.name
    }
}
