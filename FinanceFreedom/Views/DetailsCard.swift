//
//  DetailsCard.swift
//  FinanceFreedom
//
//  Created by Luismi on 4/5/24.
//

import SwiftUI

struct DetailsCard: View {
    @State private var date = "04/26/25"
    @State private var type = "Income"
    @State private var category = "Food"
    @State private var amount = "15.83"
    @State private var notes = ""
    
    var body: some View {
        NavigationView{
            ZStack{
                Color(Color.primaryColor1)
                    .ignoresSafeArea()
                VStack {  Logo()
                        .frame(maxWidth: .infinity, alignment: .top)
                        .padding(.bottom, 60)
                    VStack (alignment: .leading, spacing: 30) {
                        Button("Edit"){}
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.top, 120)
                            .padding()
                        Text(type)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.top, -35)
                            
                        HStack {
                            Text("Date")
                                .padding(.leading, 20)
                            Text("Category")
                                .padding(.leading, 50)
                            Text("Amount")
                                .padding(.leading, 50)
                        }
                            .padding()
                            .padding(.top, -35)
                        HStack {
                            TextField("", text: $date)
                                .padding(.leading, -10)
                            TextField("", text: $category)
                                .padding(.leading, 10 )
                            TextField("", text: $amount)
                                .padding(.leading, 26)
                        }.padding(.leading)
                            .padding()
                            .padding(.top, -55)
                        
                        TextEditor(text: $notes)
                            .textFieldStyle(.roundedBorder)
                            .cornerRadius(8)
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                            .background(Color.gray.opacity(0.1))
                            .frame(minHeight: 200)
                            .padding()
                            .padding(.bottom, 150)
                            .padding(.top, -20)
                    }
                    .frame(width: 350, height: 420)
                    .background(Rectangle().fill(.white))
                    .cornerRadius(10)
                    .padding()
                    .padding(.bottom, 100)
                }
            }
        }
    }
}

#Preview {
    DetailsCard()
}
