//
//  MainTabView.swift
//  GameStore
//
//  Created by Francisco Delgadillo Soria on 20/11/23.
//

import SwiftUI

struct MainTabView: View {
    @StateObject private var cartViewModel = CartViewModel()
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Image(systemName: "house.fill")
                }
                .environmentObject(cartViewModel)

            CartView()
                .tabItem {
                    Image(systemName: "cart.fill")
                }
                .environmentObject(cartViewModel)

            PurchaseView()
                .tabItem {
                    Image(systemName: "creditcard.fill")
                }
        }
        .accentColor(.black)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
