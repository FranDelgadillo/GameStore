//
//  CartView.swift
//  GameStore
//
//  Created by Francisco Delgadillo Soria on 20/11/23.
//

import SwiftUI

struct CartView: View {
    @StateObject private var cartViewModel = CartViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(cartViewModel.cartItems) { item in
                    CartItemRow(cartItem: item)
                }
                .onDelete(perform: { indexSet in
                    cartViewModel.removeItems(at: indexSet)
                })
            }
            .navigationTitle("Shopping Cart")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
