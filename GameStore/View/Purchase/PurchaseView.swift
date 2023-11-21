//
//  PurchaseView.swift
//  GameStore
//
//  Created by Francisco Delgadillo Soria on 20/11/23.
//

import SwiftUI

struct PurchaseView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var address = ""
    @State private var phoneNumber = ""
    @State private var email = ""
    @State private var zipCode = ""

    var body: some View {
        Form {
            Section(header: Text("Shipping Information")) {
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastName)
                TextField("Address", text: $address)
                TextField("Phone Number", text: $phoneNumber)
                TextField("Email", text: $email)
                TextField("Zip Code", text: $zipCode)
            }

            Section {
                Button("Place Order") {
                    // Handle order placement
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
        .navigationTitle("Checkout")
    }
}

struct PurchaseView_Previews: PreviewProvider {
    static var previews: some View {
        PurchaseView()
    }
}
