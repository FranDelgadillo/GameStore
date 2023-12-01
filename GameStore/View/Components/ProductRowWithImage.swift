//
//  ProductRowWithImage.swift
//  GameStore
//
//  Created by Francisco Delgadillo Soria on 20/11/23.
//

import SwiftUI

struct ProductRowWithImage: View {
    let article: Article

    var body: some View {
        HStack {
            Image(article.image)
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(8)

            VStack(alignment: .leading) {
                Text(article.name)
                    .font(.headline)
                Text("\(article.price) PEN")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer()
        }
        .padding()
    }
}
