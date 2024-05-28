//
//  AccountSettingsView.swift
//  FinanceFreedom
//
//  Created by Luismi on 5/27/24.
//

import SwiftUI

struct AccountSettingsView: View {
    var body: some View {
        NavigationStack {
                VStack{
                    List {
                        Button ("Change Email"){
                            
                        }
                        Button("Change Password"){
                            
                        }
                        Button("Delete Account"){
                            
                        }
                    }
                }.navigationTitle("Account Settings")
        }
    }
}

#Preview {
    AccountSettingsView()
}
