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
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color(.systemBlue))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                         Menu(content: {
                             Text("Categorías")
                             Text("Mis compras")
                            Text("Cerrar sesión")
                                 .onTapGesture {
                                     AuthService.shared.signOut()
                                 }
                         }, label: {Image(systemName: "line.horizontal.3")})
                      }
            }
        }
    }
}
