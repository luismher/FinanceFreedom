//
//  Account.swift
//  FinanceFreedom
//
//  Created by Luismi on 4/5/24.
//

import SwiftUI

struct Account: View {
    @State private var firstName = ""
    @State private var toggle = false

    var body: some View {
        NavigationStack {
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
                        Button("Edit"){}
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
                    Toggle("News Letters", isOn: $toggle)
                        .padding()
                    Toggle("Payment Reminder", isOn: $toggle)
                        .padding()
                    Button("Logout"){}
                        .buttonStyle(buttonGray())
                        .padding(.bottom)
                        .padding()
            }
        }
    }
}

#Preview {
    Account()
}
