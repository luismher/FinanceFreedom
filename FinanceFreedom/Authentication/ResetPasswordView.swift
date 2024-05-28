//
//  ResetPasswordView.swift
//  FinanceFreedom
//
//  Created by Luismi on 5/27/24.
//

import SwiftUI

@MainActor
final class ResetPasswordViewModel: ObservableObject {
    @Published var email = ""
    
    func resetPassword() async throws {
        guard !email.isEmpty else {
            print("No email or password found! ")
            return
        }
        try await AuthenticationManager.shared.resetPassword(email: email)
    }
}

struct ResetPasswordView: View {
    
    @StateObject private var viewModel = ResetPasswordViewModel()
    @Binding var showResetPasswordView: Bool
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color(Color.primaryColor1)
                    .ignoresSafeArea()
                VStack{
                    TextField("Type Email", text: $viewModel.email)
                        .padding(.top, 160)
                        .padding(.bottom)
                    Button("Send Email"){
                        Task {
                            do {
                                try await viewModel.resetPassword()
                                showResetPasswordView = false
                                print("Sent succesful!")
                            } catch {
                                print("Error")
                            }
                        }
                        
                    }.buttonStyle(buttonGray())
                        .padding()
                        .padding(.top)
                    Spacer()
                }
                .navigationTitle("Reset Password")
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .textFieldStyle(.roundedBorder)
                .disableAutocorrection(true)
                .padding()
                
            }
        }
    }
}

#Preview {
    ResetPasswordView(showResetPasswordView: .constant(false))
}
