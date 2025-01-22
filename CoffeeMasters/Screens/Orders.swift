//
//  CartView.swift
//  CoffeeMasters
//
//  Created by Stephanie Cure on 1/22/25.
//

import SwiftUI

struct Orders: View {
    @EnvironmentObject var menuManager: MenuManager
    @EnvironmentObject var cartManager: CartManager
    @AppStorage("name") var name = ""
    @AppStorage("phone") var phone = ""
    @State var orderConfirmed = false
    
    var body: some View {
        NavigationView {
            Group {
                if cartManager.cart.isEmpty {
                    EmptyCartView()
                } else {
                    OrderContentView(
                        name: $name,
                        phone: $phone,
                        cartManager: cartManager,
                        orderConfirmed: $orderConfirmed
                    )
                }
            }
            .navigationTitle("Your Order")
        }
    }
}

// Empty cart view
private struct EmptyCartView: View {
    var body: some View {
        Text("Your order is empty")
    }
}

// Main order content
private struct OrderContentView: View {
    @Binding var name: String
    @Binding var phone: String
    let cartManager: CartManager
    @Binding var orderConfirmed: Bool
    
    var body: some View {
        List {
            OrderItemsSection(cartManager: cartManager)
            CustomerDetailsSection(name: $name, phone: $phone)
            TotalSection(total: cartManager.total())
            PlaceOrderSection(orderConfirmed: $orderConfirmed)
        }
        .listSectionSeparatorTint(Color("AccentColor"))
        .listStyle(.insetGrouped)
        .alert("Order", isPresented: $orderConfirmed, actions: {
            Button("OK", role: .cancel) {
                orderConfirmed = false
            }
        }, message: {
            Text("Your order is being prepared.")
                .font(.title)
        })
    }
}

// Section for order items
private struct OrderItemsSection: View {
    let cartManager: CartManager
    
    var body: some View {
        Section("ITEMS") {
            ForEach(cartManager.cart, id: \.0.id) { item in
                OrderItem(item: item)
            }
        }
        .listRowBackground(Color("Background"))
    }
}

// Section for customer details
private struct CustomerDetailsSection: View {
    @Binding var name: String
    @Binding var phone: String
    
    var body: some View {
        Section("YOUR DETAILS") {
            VStack {
                TextField("Your Name", text: $name)
                    .textFieldStyle(.roundedBorder)
                Spacer().frame(height: 20)
                TextField("Your Phone #", text: $phone)
                    .keyboardType(.phonePad)
                    .textFieldStyle(.roundedBorder)
            }
            .padding(.vertical)
        }
        .listRowBackground(Color("Background"))
    }
}

// Section for total amount
private struct TotalSection: View {
    let total: Double
    
    var body: some View {
        Section {
            HStack {
                Spacer()
                Text("Total")
                Spacer()
                Text("$ \(total, specifier: "%.2f")")
                    .bold()
                Spacer()
            }
        }
        .listRowBackground(Color.clear)
    }
}

// Section for place order button
private struct PlaceOrderSection: View {
    @Binding var orderConfirmed: Bool
    
    var body: some View {
        Section {
            HStack {
                Spacer()
                Button("Place Order") {
                    //TODO: Validation
                    orderConfirmed = true
                }
                .padding()
                .frame(width: 250.0)
                .background(Color("Alternative2"))
                .foregroundColor(Color.black)
                .cornerRadius(25)
                Spacer()
            }
        }
        .listRowBackground(Color.clear)
    }
}

#Preview {
    Orders()
        .environmentObject(CartManager())
        .environmentObject(MenuManager())
}
