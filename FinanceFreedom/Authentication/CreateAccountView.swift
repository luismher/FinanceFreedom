//
//  EmailAccount.swift
//  FinanceFreedom
//
//  Created by Luismi on 5/27/24.
//

import SwiftUI

@MainActor
final class CreateAccountViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
}

struct CreateAccountView: View {
    
    @StateObject private var viewModel = CreateAccountViewModel()
    var body: some View {
        NavigationStack{
            ZStack{
                Color(Color.primaryColor1)
                    .ignoresSafeArea()
                VStack{
                    TextField("Email", text: $viewModel.email )
                        .padding(.top, 40 )
                    SecureField("Password", text: $viewModel.password )
                        .padding(.top)
                    SecureField("Confirm Password", text: $viewModel.confirmPassword )
                        .padding(.top)
                    Button("Sign In"){}
                        .buttonStyle(buttonGray())
                        .padding(.top, 40)
                    Spacer()
                }.navigationTitle("Create Account")
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .textFieldStyle(.roundedBorder)
                        .disableAutocorrection(true)
                        .padding()

            }
        }
    }
}
#Preview {
    CreateAccount()
}
