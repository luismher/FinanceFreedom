//
//  Onboarding.swift
//  FinanceFreedom
//
//  Created by Luismi on 4/5/24.
//

import SwiftUI

@MainActor
final class AuthenticationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func signIn() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found! ")
            return
        }
        try await AuthenticationManager.shared.signIn(email: email, password: password)
    }
}


struct AuthenticationView: View {
    
    
    @StateObject private var viewModel = AuthenticationViewModel()
    @State private var userName = ""
    @Binding var showCreateAccountView: Bool
    @Binding var showResetPasswordView: Bool

    var body: some View {
            NavigationStack{
            ZStack{
                Color(Color.primaryColor1)
                    .ignoresSafeArea()
                VStack{
                    Logo()
                        .frame(maxWidth: .infinity, alignment: .top)
                        .padding(35)
                        .padding(.top)
                    
                    TextField("Email", text: $viewModel.email)
                        .keyboardType(.emailAddress)
                        .padding(2)
                    SecureField("Password", text: $viewModel.password)
                        .padding(.top)
                        .padding(.bottom)
                    HStack {
                        
                        VStack{
                            NavigationLink{ ResetPasswordView(showResetPasswordView: $showResetPasswordView) } label: {
                                Text("Forgot Password")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.custom("Khula", size: 16))
                                    .padding(.bottom)
                            }
                            
                            NavigationLink{ CreateAccountView(showCreateAccountView: $showCreateAccountView ) }label: {
                                Text("Create Account")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.custom("Khula", size: 16))
                                    .padding(.top, 10)
                            }
                        }
                        Button("Face Id", systemImage: "faceid"){}
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .font(.custom("Khula", size: 18))
                            
                    }
                    .padding(.top)
                    Spacer()
                    Button("Login"){
                        Task {
                            do {
                                try await viewModel.signIn()
                                showCreateAccountView = false
                            } catch{
                                print("Error.. \(error)")
                            }
                        }
                    }
                        .buttonStyle(buttonGray())
                        .padding(.bottom)
                    
                    
                    
                }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .textFieldStyle(.roundedBorder)
                    .disableAutocorrection(true)
                    .padding()
            }
        }
    }
}

#Preview {
    NavigationStack {
        AuthenticationView(showCreateAccountView: .constant(false), showResetPasswordView: .constant(false))
        
        
    }
}
