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
    
    func signUp() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found! ")
            return
        }
        try await AuthenticationManager.shared.createUser(email: email, password: password)
    }
}

struct CreateAccountView: View {
    
    @StateObject private var viewModel = CreateAccountViewModel()
    @Binding var showCreateAccountView: Bool
    
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
                    SecureField("Confirm Password", text: $viewModel.password   )
                        .padding(.top)
                    Button("Sign Up"){
                        Task {
                            do {
                                try await viewModel.signUp()
                                showCreateAccountView = false
                            } catch{
                                print("Error.. \(error)")
                            }
                        }
                    }
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
    NavigationStack {
        CreateAccountView(showCreateAccountView: .constant(false))
    }
}
