//
//  RootView.swift
//  FinanceFreedom
//
//  Created by Luismi on 5/27/24.
//

import SwiftUI

struct RootView: View {
    @State private var showAuthenticationView: Bool = false
    @State private var showCreateAccountView: Bool = false
    @State private var showResetPasswordView: Bool = false
    @State private var showUpdatePassword: Bool = false
    @State private var showAccountView: Bool = false
    
    var body: some View {
        ZStack {
            NavigationStack {
                AccountView(showCreateAccountView: $showCreateAccountView, showUpdatePassword: $showUpdatePassword, showAuthenticationView: $showAuthenticationView, showAccountView: .constant(false))
            }
        }.onAppear{
            let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
            self.showAuthenticationView   = authUser == nil
            
        }.fullScreenCover(isPresented: $showAuthenticationView){
            NavigationStack {
                AuthenticationView(showCreateAccountView: $showCreateAccountView, showResetPasswordView: $showResetPasswordView, showAuthenticationView: $showAuthenticationView, showAccountView: .constant(false))
            }
        }
    }
}

#Preview {
    RootView()
}
