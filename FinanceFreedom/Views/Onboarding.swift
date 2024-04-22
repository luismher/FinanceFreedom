//
//  Onboarding.swift
//  FinanceFreedom
//
//  Created by Luismi on 4/5/24.
//

import SwiftUI

struct Onboarding: View {
    
    @State private var userName = ""

    var body: some View {
            NavigationStack{
            ZStack{
                Color(Color.primaryColor1)
                    .ignoresSafeArea()
                VStack{
                    Logo()
                        .frame(maxWidth: .infinity, alignment: .top)
                        .padding()
                    Text("Email")
                        .onboardingText()
                        .padding(.top)
                    TextField("Username", text: $userName)
                        .keyboardType(.emailAddress)
                    Text("Password")
                        .onboardingText()
                    TextField("Password", text: $userName)
                        .padding(.bottom)
                    HStack {
                        
                        VStack{
                            Button("Forgot Password"){}
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.custom("Khula", size: 14))
                            Button("Create Account"){}
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.custom("Khula", size: 14))
                                .padding(.top, 10)
                        }
                        Button("Face Id", systemImage: "faceid"){}
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .font(.custom("Khula", size: 16))
                            
                    }
                    Spacer()
                    Button("Login"){}
                        .buttonStyle(buttonGray())
                        .padding(.bottom)
                    
                    
                    
                }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .textFieldStyle(.roundedBorder)
                    .disableAutocorrection(true)
                    .padding()
            }
        }
    }
}

#Preview {
    Onboarding()
}
