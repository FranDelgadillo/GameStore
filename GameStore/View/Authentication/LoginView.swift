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
    @State private var showAlert = false
    @State private var alertMessage = ""
    var body: some View {
        
        NavigationStack{
            ZStack{
                
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                    .overlay(
                
                VStack {
                    Spacer()
                    
                    Text("GameStop")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    TextField("Email", text: $authViewModel.email)
                        .autocapitalization(.none)
                        .modifier(AuthTextModifier())
                        .frame(width: 360, height: 44)
                    
                    SecureField("Password", text: $authViewModel.password)
                        .autocapitalization(.none)
                        .modifier(AuthTextModifier())
                        .frame(width: 360, height: 44)
                    
                    Button(action: {
                        login()
                    }) {
                        Text("Login")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 360, height: 44)
                            .background(Color(.blue))
                            .cornerRadius(8)
                    }

                    NavigationLink {
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
                
                //Alert
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Oops!"), message: Text(alertMessage), dismissButton: .default(Text("Try again")))
                }
            )}
            
        }
        
    }

    private func login() {
        Task {
            do {
                try await authViewModel.login()
            } catch {
                showAlert = true
                alertMessage = "Incorrect email or password"
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
