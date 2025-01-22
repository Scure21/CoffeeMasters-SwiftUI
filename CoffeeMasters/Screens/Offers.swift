//
//  Offers.swift
//  CoffeeMasters
//
//  Created by Stephanie Cure on 1/22/25.
//

import SwiftUI

struct Offers: View {
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Offer(title: "Early Coffee", description: "10% off. Offer valid from 6am to 9am.")
                    Offer(title: "Welcome Gift", description: "25% off on your first order.")
                    Offer(title: "Welcome Gift", description: "25% off on your first order.")
                }.listStyle(.plain) .listRowSeparator(.hidden)
                   
            }.navigationTitle("Offers")
        }
    }
}

#Preview {
    Offers()
}
