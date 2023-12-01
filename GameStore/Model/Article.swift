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
    let consoleBrand: ConsoleBrand
    let price: Double
    let image: String
}


extension Article {
    static var MOCK_ARTICLES: [Article] = [
        Article(name: "Spiderman 2", consoleBrand: .PlayStation, price: 69.00, image: "spiderman2"),
        Article(name: "Horizon Forbidden West", consoleBrand: .PlayStation, price: 69.00, image: "horizonfw"),
        Article(name: "Resident Evil 4 Remake", consoleBrand: .PlayStation, price: 69.00, image: "resident4"),
        Article(name: "God of War Ragnarok", consoleBrand: .PlayStation, price: 69.00, image: "godofwarr"),
        Article(name: "The Last of Us Part I", consoleBrand: .PlayStation, price: 69.00, image: "tlou1"),
        Article(name: "Returnal", consoleBrand: .PlayStation, price: 59.00, image: "returnal"),
        Article(name: "Call of Duty MW3", consoleBrand: .Xbox, price: 49.00, image: ""),
        Article(name: "Super Mario Bros. Wonder", consoleBrand: .Nintendo, price: 59.00, image: ""),
    ]
}
