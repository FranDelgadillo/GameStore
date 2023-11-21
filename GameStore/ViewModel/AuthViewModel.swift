//
//  AuthViewModel.swift
//  GameStore
//
//  Created by Francisco Delgadillo Soria on 20/11/23.
//

import Foundation

class AuthViewModel: ObservableObject {
    
    private let authService = AuthService.shared
    
    @Published var email = ""
    @Published var password = ""
    @Published var username = ""
    
    func login() async throws {
        try await authService.login(email: email, password: password)
    }
    
    func signUp() async throws {
        try await authService.createUser(email: email, username: username, password: password)
    }
    
    func createUser()
        async throws{
            try await
            AuthService.shared.createUser(email: email, username: username, password: password)
        
    }
}
