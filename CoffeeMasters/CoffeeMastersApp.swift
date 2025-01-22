//
//  CoffeeMastersApp.swift
//  CoffeeMasters
//
//  Created by Stephanie Cure on 1/21/25.
//

import SwiftUI

@main
struct CoffeeMastersApp: App {
    var menuManager = MenuManager()
    var cartManager = CartManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(menuManager)
                .environmentObject(cartManager)
        }
    }
}
