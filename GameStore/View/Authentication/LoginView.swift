//
//  LoginView.swift
//  GameStore
//
//  Created by Francisco Delgadillo Soria on 20/11/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var authViewModel = AuthViewModel()
    @State private var isSignUpActive = false
    var body: some View {
        
        NavigationStack{
            VStack {
                Spacer()
                
                Text("GameStore")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Spacer()
                
                TextField("Email", text: $authViewModel.email)
                    .autocapitalization(.none)
                    .modifier(AuthTextModifier())
                
                SecureField("Password", text: $authViewModel.password)
                    .autocapitalization(.none)
                    .modifier(AuthTextModifier())
                
                Button(action: {
                    Task{
                        try await authViewModel.login()
                    }
                }) {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 44)
                        .background(Color(.systemBlue))
                        .cornerRadius(8)
                }

                /*// Sign Up Button with NavigationLink
                Button(action: {
                    // Set isSignUpActive to true to trigger NavigationLink
                    isSignUpActive = true
                }) {
                Text("Sign Up")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 44)
                        .background(Color(.systemGreen))
                        .cornerRadius(8)
                }
                    .overlay(
                    NavigationLink(
                    destination: SignUpView(),
                    isActive: $isSignUpActive
                ) {
                    EmptyView()
                }
                    .hidden()
                )   */

                NavigationLink {
                    //Destino de Sign up
                    SignUpView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    Text("Sign Up")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 44)
                        .background(Color(.systemBlue))
                        .cornerRadius(8)
                }
                
                Spacer()
            }
            .padding()
            .background(Color.gray.opacity(0.1))
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
