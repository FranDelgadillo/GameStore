//
//  ContentView.swift
//  GameStore
//
//  Created by Francisco Delgadillo Soria on 20/11/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    @StateObject var authViewModel:AuthViewModel = AuthViewModel()// Replace with your authentication ViewModel
    
    var body: some View {
        if viewModel.userSession == nil {
            LoginView().environmentObject(AuthViewModel()) // Instantiate AuthViewModel
        } else {
            MainTabView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
