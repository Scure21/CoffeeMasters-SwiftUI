//
//  OrderItem.swift
//  CoffeeMasters
//
//  Created by Stephanie Cure on 1/22/25.
//

import SwiftUI

struct OrderItem: View {
    var item: (Product, Int)
    
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        HStack {
            Text("\(item.1)x")
            Text(item.0.name)
            Spacer()
            Text("$ \(Double(item.1) * item.0.price, specifier: "%.2f")")
//            Spacer()
            Image(systemName: "trash")
                .font(.subheadline)
                .foregroundColor(Color("Secondary"))
                .padding()
                .onTapGesture{
                    cartManager.remove(product: item.0)
                }
        }
    }
}

#Preview {
    // item: (Product(id: 0, name: "", description: "", price: 1.23, image: ""), 0)
    OrderItem(item: (Product(id: 0, name: "name", description: "desc", price: 1.23, image: ""), 0))
}
