//
//  RootView.swift
//  FinanceFreedom
//
//  Created by Luismi on 5/27/24.
//

import SwiftUI

struct RootView: View {
    
    @State private var showCreateAccountView: Bool = false
    @State private var showResetPasswordView: Bool = false
    var body: some View {
        ZStack {
            NavigationStack {
                AccountView(showCreateAccountView: $showCreateAccountView)
            }
        }.onAppear{
            let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
            self.showCreateAccountView  = authUser == nil
            
        }.fullScreenCover(isPresented: $showCreateAccountView){
            NavigationStack {
                AuthenticationView(showCreateAccountView: $showCreateAccountView, showResetPasswordView: $showResetPasswordView)
            }
        }
    }
}

#Preview {
    RootView()
}
