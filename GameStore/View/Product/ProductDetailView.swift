//
//  ProductDetailView.swift
//  GameStore
//
//  Created by Francisco Delgadillo Soria on 20/11/23.
//

import SwiftUI

struct ProductDetailView: View {
    let article: Article
    @EnvironmentObject private var cartViewModel: CartViewModel

    var body: some View {
        VStack {
            Image(article.image)
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .cornerRadius(8)

            VStack(alignment: .leading, spacing: 16) {
                Text(article.name)
                    .font(.title)
                    .fontWeight(.bold)

                Text("\(article.price) PEN")
                    .font(.headline)
                    .foregroundColor(.gray)

                Spacer()

                Button("Add to Cart") {
                    let cartItem = CartItem(article: article, quantity: 1)
                    cartViewModel.addToCart(cartItem: cartItem)
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            .padding()
            .navigationBarTitle(article.name)
        }
    }
}
