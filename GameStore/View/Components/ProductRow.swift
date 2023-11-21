//
//  ProductRow.swift
//  GameStore
//
//  Created by Francisco Delgadillo Soria on 20/11/23.
//

import SwiftUI

struct ProductRow: View {
    let article: Article

    var body: some View {
        HStack {
            Text(article.name)
                .font(.headline)

            Spacer()

            Text("\(article.price) PEN")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
    }
}
