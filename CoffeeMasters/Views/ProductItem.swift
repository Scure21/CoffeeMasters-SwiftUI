//
//  ProductItem.swift
//  CoffeeMasters
//
//  Created by Stephanie Cure on 1/22/25.
//

import SwiftUI

struct ProductItem: View {
    var product: Product
    
    
    var body: some View {
        VStack{
            AsyncImage(url: product.imageURL)
                .frame(width: 300, height: 150)
                .background(Color("AccentColor"))
            HStack {
                VStack(alignment: .leading) {
                    Text(product.name)
                        .font(.title3)
                        .bold()
                    Text("$ \(product.price)")
                        .font(.caption)

                }.padding(8)
                Spacer()
            }
        }
        .background(Color("SurfaceBackground"))
        .cornerRadius(10)
        .padding(.trailing)
    }
}

#Preview {
    ProductItem(product: Product(id: 1, name: "Dummy name",description: "dummy desc", price: 1.23, image: "" ))
}
