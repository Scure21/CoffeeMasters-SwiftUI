//
//  offer.swift
//  CoffeeMasters
//
//  Created by Stephanie Cure on 1/21/25.
//

import SwiftUI

struct Offer: View {
    var title = ""
    var description = ""
    
    var body: some View {
        ZStack{
            Image("BackgroundPattern")
                .frame(maxWidth: .infinity, maxHeight: 300)
                .clipped()
            VStack {
                Text(title)
                    .padding()
                    .font(.title)
                    .background(Color("CardBackground"))
                    .padding(.bottom, 20)
                Text(description)
                    .padding()
                    .background(Color("CardBackground"))
            }
            .frame(maxWidth: .infinity, minHeight: 150, maxHeight: 150, alignment: .center)
        }.background(Color.white)
       
    }
}

#Preview {
    Offer(title: "My offer", description: "this is an offer description")
}

#Preview {
    Offer(title: "My offer 2", description: "this is an offer description 2")
      
        
}
