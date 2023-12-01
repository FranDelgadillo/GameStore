//
//  MainView.swift
//  GameStore
//
//  Created by Francisco Delgadillo Soria on 20/11/23.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = ProductViewModel()
    @StateObject private var cartViewModel = CartViewModel()
    @State private var selectedConsole = ConsoleBrand.allCases.first

    var body: some View {
        NavigationView {
            VStack {

                AsyncImage(url: URL(string: "https://companiesmarketcap.com/img/company-logos/256/GME.png"), scale: 2)
                                    .frame(height: 20)
                Picker("Select Console", selection: $selectedConsole) {
                    ForEach(ConsoleBrand.allCases, id: \.self) { console in
                    Text(console.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                List(viewModel.getProducts(for: selectedConsole!)) { product in
                    NavigationLink(destination: ProductDetailView(article: product)
                            .environmentObject(cartViewModel)) {
                        ProductRowWithImage(article: product)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Image(systemName: "line.horizontal.3")
                        .imageScale(.large)
                        .onTapGesture {
                            AuthService.shared.signOut()
                        }
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
