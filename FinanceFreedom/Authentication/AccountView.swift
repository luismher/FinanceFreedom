//
//  Account.swift
//  FinanceFreedom
//
//  Created by Luismi on 4/5/24.
//

import SwiftUI

@MainActor

final class AccountViewModel: ObservableObject {
    
    func signOut() throws {
        try AuthenticationManager.shared.signOut()
    }
    
}

struct AccountView: View {
    @State private var firstName = ""
    @State private var toggle = false
    @StateObject private var viewModel = AccountViewModel()
    @Binding var showSignInView: Bool
    var body: some View {
        NavigationStack {
            ZStack{
                Color(Color.primaryColor1)
                    .ignoresSafeArea()
                ScrollView {
                    VStack {
                        Text("Personal Information")
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top, 40)
                    
                    HStack{
                        Image("FFLogo")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                            .padding(.trailing)
                        Button("Save"){}
                            .padding()
                    }.frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    VStack{
                        Text("First Name *")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextField("", text: $firstName)
                        Text("Last Name *")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextField("", text: $firstName)
                        Text("Email *")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextField("", text: $firstName)
                        Text("Phone")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextField("", text: $firstName)
                        
                    }.textFieldStyle(.roundedBorder)
                        .padding()
                    Text("Notifictaions")
                    
                    Toggle("Offers", isOn: $toggle)
                        .padding()
                        .toggleStyle(SwitchToggleStyle(tint: Color.blue))
                    Toggle("News Letters", isOn: $toggle)
                        .padding()
                        .toggleStyle(SwitchToggleStyle(tint: Color.blue))
                        
                    Toggle("Payment Reminder", isOn: $toggle)
                        .padding()
                        .toggleStyle(SwitchToggleStyle(tint: Color.blue))
                    Button("Logout"){
                        Task {
                            do {
                                try viewModel.signOut()
                                showSignInView = true
                            } catch {
                                 print(error)
                            }
                        }
                    }
                        .buttonStyle(buttonGray())
                        .padding(.bottom)
                        .padding()
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        AccountView(showSignInView: .constant(false ))
    }
}
