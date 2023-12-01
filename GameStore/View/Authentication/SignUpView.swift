//
//  SignUpView.swift
//  GameStore
//
//  Created by Francisco Delgadillo Soria on 20/11/23.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var authViewModel = AuthViewModel()
    @State private var registrationSuccessful = false
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.gray.edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    
                    Text("Create an account with us ")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    TextField("Email", text: $authViewModel.email)
                        .autocapitalization(.none)
                        .modifier(AuthTextModifier())
                    
                    SecureField("Password", text: $authViewModel.password)
                        .autocapitalization(.none)
                        .modifier(AuthTextModifier())
                    
                    Button(action: {
                        createAccount()
                    }) {
                        Text("Create account")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 330, height: 44)
                            .background(Color(.systemBlue))
                            .cornerRadius(8)
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Oops!"), message: Text(alertMessage), dismissButton: .default(Text("Try again")))
                    }
                    
                    if registrationSuccessful {
                        Text("Successful registration!")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(8)
                            .padding(.top)
                    }
                    
                    Spacer()
                }
                .padding()
                .padding(.horizontal)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Image(systemName: "chevron.left")
                            .imageScale(.large)
                            .onTapGesture {
                                self.dismiss()
                            }
                    }
                }
            }
        }
    }
    
    private func createAccount() {
        guard !authViewModel.email.isEmpty,
              !authViewModel.password.isEmpty else {
            showAlert(message: "Please complete all the fields")
            return
        }
        
        Task {
            do {
                try await authViewModel.createUser()
                registrationSuccessful = true
            } catch {
                showAlert(message: "Failed to create account. Please try again.")
            }
        }
    }
    
    private func showAlert(message: String) {
        alertMessage = message
        showAlert = true
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
