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
            ZStack{
                Color(Color.primaryColor1)
                    .ignoresSafeArea()
                VStack {
                    VStack {
                        Text("Personal Information")
                        }.padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
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
                        Text("First Name")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextField("", text: $firstName)
                        Text("Last Name")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextField("", text: $firstName)
                        Text("Email")
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
                }
            }
        }
    }
}

#Preview {
    Account()
}
