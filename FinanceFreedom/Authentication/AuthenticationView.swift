//
//  Onboarding.swift
//  FinanceFreedom
//
//  Created by Luismi on 4/5/24.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift
import AuthenticationServices
import CryptoKit



@MainActor
final class AuthenticationViewModel: ObservableObject {
    
    private var currentNonce: String?
    @Published var email = ""
    @Published var password = ""
    let signInAppleMethod = SignInAppleMethod()
    
    func signIn() async throws {
/*        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found! ")
            return
        }
    */
        try await AuthenticationManager.shared.signIn(email: email, password: password)
    }
    
    func signInGoogle() async throws {
        let method = GoogleSignInMethod()
        let tokens = try await  method.signIn()
        try await AuthenticationManager.shared.signInWithGoogle(tokens: tokens) 
    }
    
    func signInApple() async throws {
        let method = SignInAppleMethod()
        let tokens = try await method.startSignInWithAppleFlow()
        try await AuthenticationManager.shared.signInWithApple(tokens: tokens)
    }
}


struct AuthenticationView: View {
    
    @StateObject private var viewModel = AuthenticationViewModel()
    @State private var userName = ""
    @Binding var showCreateAccountView: Bool
    @Binding var showResetPasswordView: Bool
    @Binding var showAuthenticationView: Bool 
    @Binding var showAccountView: Bool

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
                        .padding(.bottom)
                        Button("Login"){
                            Task {
                                do {
                                    try await viewModel.signIn()
                                    showAuthenticationView = false
                                } catch{
                                    print("Error.. \(error)")
                                }
                            }
                        }
                        .buttonStyle(buttonGray())
                        .padding(.bottom)
                        .padding(.top )
                        Spacer()
                        Text("--Or Sign in with--")
                        Spacer()
                        GoogleSignInButton(viewModel: GoogleSignInButtonViewModel(scheme: .light, style: .wide, state: .pressed)) {
                            Task {
                                do{
                                    try await viewModel.signInGoogle()
                                    showAuthenticationView = false
                                } catch {
                                    print(Error.self)
                                }
                                
                            }
                        }
                        .cornerRadius(6)
                        .padding()
                        .padding(.horizontal, 50)
                        
                        Button(action: {
                            Task {
                                do{
                                    try await viewModel.signInApple()
                                    showAuthenticationView = false
                                } catch {
                                    print(Error.self)
                                }
                            }
                        }, label: {
                            SignInWithAppleView(type: .default, style: .black)
                            .allowsHitTesting(false)
                        })
                        .frame(height: 45)
                        .padding(.horizontal, 65)
                        Spacer()
                        
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
        AuthenticationView(showCreateAccountView: .constant(false), showResetPasswordView: .constant(false), showAuthenticationView: .constant(false), showAccountView: .constant(false))
        
        
    }
}
