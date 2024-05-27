//
//  RootView.swift
//  FinanceFreedom
//
//  Created by Luismi on 5/27/24.
//

import SwiftUI

struct RootView: View {
    
    @State private var showSignInView: Bool = false
    
    var body: some View {
        ZStack {
            NavigationStack {
                AccountView(showSignInView: $showSignInView)
            }
        }.onAppear{
            let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
            self.showSignInView = authUser == nil
        }.fullScreenCover(isPresented: $showSignInView){
            NavigationStack {
                AuthenticationView()
            }
        }
    }
}

#Preview {
    RootView()
}
