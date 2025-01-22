//
//  ContentView.swift
//  CoffeeMasters
//
//  Created by Stephanie Cure on 1/21/25.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        TabView{
            Home()
                .tabItem {
                    Image(systemName:"cup.and.saucer")
                    Text("Home")
                }
            Offers()
                .tabItem {
                    Image(systemName:"tag")
                    Text("Offers")
                }
            Orders()
                .tabItem {
                    Image(systemName:"cart")
                    Text("My Order")
                } .badge(cartManager.cart.count)
            Info()
                .tabItem {
                    Image(systemName:"info.circle")
                    Text("Info")
                }
      
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(CartManager())
}
