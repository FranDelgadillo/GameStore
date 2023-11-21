//
//  ProductViewModel.swift
//  GameStore
//
//  Created by Francisco Delgadillo Soria on 20/11/23.
//

import Foundation

class ProductViewModel: ObservableObject {
    @Published var articles: [Article] = []

    init() {
        // Initialize with placeholder data
        generateMockData()
    }

    func getProducts(for console: ConsoleBrand) -> [Article] {
        return articles.filter { $0.consoleBrand == console.rawValue }
    }

    private func generateMockData() {
        articles = [
            Article(name: "Spiderman 2", consoleBrand: ConsoleBrand.PlayStation.rawValue, price: 59.99),
            Article(name: "Call of Duty MW3", consoleBrand: ConsoleBrand.Xbox.rawValue, price: 49.99),
            Article(name: "Super Mario Bros. Wonder", consoleBrand: ConsoleBrand.Nintendo.rawValue, price: 39.99),
            // Add more articles as needed
        ]
    }
}
