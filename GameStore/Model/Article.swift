//
//  Article.swift
//  GameStore
//
//  Created by Francisco Delgadillo Soria on 20/11/23.
//

import Foundation

struct Article: Identifiable {
    let id = UUID()
    let name: String
    let consoleBrand: String
    let price: Double

}


extension Article {
    static var MOCK_ARTICLES: [Article] = [
        Article(name: "Spiderman 2", consoleBrand: "PlayStation", price: 69.99),
        Article(name: "Call of Duty MW3", consoleBrand: "Xbox", price: 49.99),
        Article(name: "Super Mario Bros. Wonder", consoleBrand: "Nintendo", price: 59.99),
        // Add more mock articles as needed
    ]
}
