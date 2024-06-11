//
//  AccountSettingsView.swift
//  FinanceFreedom
//
//  Created by Luismi on 5/27/24.
//

import SwiftUI

@MainActor
final class UpdateSettings: ObservableObject {
    
    @Published var authProviders: [AuthProviderOption] = []
    @Published var password = ""
    @Published var authUser: AuthDataResultModel? = nil

    func loadAuthUser() {
        self.authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
    }
    
    func loadAuthproviders() {
        if let provider = try? AuthenticationManager.shared.getProvider(){
            authProviders = provider
        }
    }
    
    func updatePassword() async throws {
        guard !password.isEmpty else {
            print("Password too short.")
            return
        }
        try await AuthenticationManager.shared.updatePassword(password: password)
    }
    
    func linkGoogleAccount() async throws {
        let method = GoogleSignInMethod()
        let tokens = try await  method.signIn()
        self.authUser = try await AuthenticationManager.shared.linkGoogle(tokens: tokens)
    }
    
    func linkAppleAccount() async throws {
        let method = SignInAppleMethod()
        let tokens = try await  method.startSignInWithAppleFlow()
        self.authUser = try await AuthenticationManager.shared.linkApple(tokens: tokens)
    }
    func linkEmailAccount() async throws {
        let email = ""
        let password = ""
        self.authUser = try await AuthenticationManager.shared.linkEmail(email: email, password: password)
    }
    
    func delete() async throws {
        try await AuthenticationManager.shared.delete()
    }
}


struct AccountSettingsView: View {
    @StateObject var viewModel = UpdateSettings()
    @Binding var showUpdatePassword: Bool
    @Binding var showAuthenticationView: Bool

    var body: some View {
        NavigationStack {
            VStack{ 
                List {
                    if viewModel.authProviders.contains(.email) {
                        accountSettings
                    }
                    
                    if viewModel.authUser? .isAnonymus == true {
                        linkSection
                    }

                    Section(header: Text("Delete Account")){
                            Button("Delete Account"){
                                Task{
                                    do {
                                       try await viewModel.delete()
                                        showAuthenticationView = true
                                    } catch {
                                        print(error)
                                    }
                                }
                        }.buttonStyle(buttonRed())
                    }
                }
                .onAppear{
                    viewModel.loadAuthproviders()
                    viewModel.loadAuthUser()
                }
            }.navigationTitle("Account Settings")
        }
    }
}

#Preview {
    AccountSettingsView(showUpdatePassword: .constant(false), showAuthenticationView: .constant(false))
}

extension AccountSettingsView {
    
    private var accountSettings: some View {
        
        Section(header: Text("Change Password")){
            SecureField("Type new password..", text: $viewModel.password)
            
            Button ("Update Password"){
                Task {
                    do{
                        try await viewModel.updatePassword()
                        showUpdatePassword = false
                        print("Updated Succesful!")
                    } catch {
                        print("Error")
                    }
                }
            }.buttonStyle(buttonBlue())
        }
    }
    
    private var linkSection: some View {
        
        Section(header: Text("Link Accounts")){
             
            Button ("Link Google Account"){
                Task {
                    do{
                        try await viewModel.linkGoogleAccount()
                        showUpdatePassword = false
                        print("Google Linked!")
                    } catch {
                        print("Error")
                    }
                }
            }.buttonStyle(buttonBlue())
            
            Button ("Link Apple Account"){
                Task {
                    do{
                        try await viewModel.linkAppleAccount()
                        showUpdatePassword = false
                        print("Apple Linked!")
                    } catch {
                        print("Error")
                    }
                }
            }.buttonStyle(buttonBlue())
            
            Button ("Link Email Account"){
                Task {
                    do{
                        try await viewModel.linkEmailAccount()
                        showUpdatePassword = false
                        print("Email Linked!")
                    } catch {
                        print("Error")
                    }
                }
            }.buttonStyle(buttonBlue())
        }
    }
}

