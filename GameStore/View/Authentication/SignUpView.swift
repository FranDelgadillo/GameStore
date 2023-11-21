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
    var body: some View {
        NavigationStack{
            
            VStack {
                Spacer()
                
                Text("Create an account with us ")
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
                
                SecureField("Confirm password", text: $authViewModel.password)
                    .autocapitalization(.none)
                    .modifier(AuthTextModifier())
                
                Button(action: {
                    Task{
                        try await authViewModel.createUser()
                    }
                }) {
                    Text("Create account")
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
            .padding(.horizontal)
            .toolbar{
                ToolbarItem(placement:
                        .navigationBarLeading){
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

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
