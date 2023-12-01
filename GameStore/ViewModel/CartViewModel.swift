//
//  CartViewModel.swift
//  GameStore
//
//  Created by Francisco Delgadillo Soria on 20/11/23.
//

import Foundation

class CartViewModel: ObservableObject {
    @Published var cartItems: [CartItem] = []

    func addToCart(cartItem: CartItem) {
        if let existingItemIndex = cartItems.firstIndex(where: { $0.article.id == cartItem.article.id }) {

            cartItems[existingItemIndex].quantity += 1
        } else {

            cartItems.append(cartItem)
        }
    }

    func removeItems(at indices: IndexSet) {
        cartItems.remove(atOffsets: indices)
    }

    func getTotalPrice() -> Double {
        return cartItems.reduce(0.0) { $0 + ($1.article.price * Double($1.quantity)) }
    }

}


