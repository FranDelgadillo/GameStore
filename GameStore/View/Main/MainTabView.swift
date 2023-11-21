//
//  MainTabView.swift
//  GameStore
//
//  Created by Francisco Delgadillo Soria on 20/11/23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Image(systemName: "house.fill")
                }

            CartView()
                .tabItem {
                    Image(systemName: "cart.fill")
                }

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
