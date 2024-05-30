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
    
}


struct AccountSettingsView: View {
    @StateObject var viewModel = UpdateSettings()
    @Binding var showUpdatePassword: Bool
    var body: some View {
        NavigationStack {
            VStack{
                List {
                    if viewModel.authProviders.contains(.email) {
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
                    Section(header: Text("Delete Account")){
                            Button("Delete Account"){
                        }.buttonStyle(buttonRed())
                    }
                }
                .onAppear{
                    viewModel.loadAuthproviders()
                }
            }.navigationTitle("Account Settings")
        }
    }
}

#Preview {
    AccountSettingsView(showUpdatePassword: .constant(false))
}
