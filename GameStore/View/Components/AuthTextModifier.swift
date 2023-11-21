//
//  AuthTextModifier.swift
//  GameStore
//
//  Created by Francisco Delgadillo Soria on 20/11/23.
//

import SwiftUI

import SwiftUI

struct AuthTextModifier:ViewModifier{
    func body(content:Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
    }
}

