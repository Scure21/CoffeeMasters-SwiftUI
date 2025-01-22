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
                        
                        ZStack{
                            NavigationLink(destination: Details(product: product)){
                                    EmptyView()
                            }.opacity(0)
                            ProductItem(product:product)
                                .padding(.top)
                                .padding(.leading)
                                .padding(.bottom, 12)
                        }
                    }.listRowSeparator(.hidden)
                    
                }
            }.navigationTitle("Products")
        }
    }
}

#Preview {
    Home().environmentObject(MenuManager())
}
