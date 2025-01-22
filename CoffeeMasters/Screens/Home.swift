//
//  HomeView.swift
//  CoffeeMasters
//
//  Created by Stephanie Cure on 1/22/25.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var menuManager: MenuManager
    
    var body: some View {
        NavigationView {
            List {
                ForEach(menuManager.menu) { category in
                    Text(category.name)
                    
                    ForEach(category.products) {
                        product in
                        
                        NavigationLink{
                            Details()
                        } label: {
                            ProductItem(product:product)
                        }
                    }
                }
            }.navigationTitle("Products")
        }
    }
}

#Preview {
    Home().environmentObject(MenuManager())
}
