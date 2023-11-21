//
//  CartItemRow.swift
//  GameStore
//
//  Created by Francisco Delgadillo Soria on 20/11/23.
//

import SwiftUI

struct CartItemRow: View {
    let cartItem: CartItem

    var body: some View {
        HStack {
            Text(cartItem.article.name)
                .font(.headline)
            Spacer()
            Text("Quantity: \(cartItem.quantity)")
                .font(.subheadline)
        }
    }
}
