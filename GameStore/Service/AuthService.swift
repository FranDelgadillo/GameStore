//
//  AuthService.swift
//  GameStore
//
//  Created by Francisco Delgadillo Soria on 20/11/23.
//

import Foundation
import FirebaseAuth

class AuthService{
    @Published
    var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init(){
        self.userSession = Auth.auth().currentUser
    }
    
    func login(email: String, password: String) async throws {
        
    }
    
    func createUser(email: String, username: String, password: String) async throws {
        let result = try await
            Auth.auth().createUser(withEmail: email, password: password)
        self.userSession = result.user
    }
    
    func loadUsers() async throws{
        
    }
    
    func signOut(){
       
        try?Auth.auth().signOut()
        self.userSession=nil
    }
}
