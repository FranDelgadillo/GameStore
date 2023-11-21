//
//  CartItem.swift
//  GameStore
//
//  Created by Francisco Delgadillo Soria on 20/11/23.
//

import Foundation

struct CartItem: Identifiable {
    let id = UUID()
    let article: Article
    var quantity: Int
}
