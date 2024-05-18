//
//  Details.swift
//  FinanceFreedom
//
//  Created by Luismi on 4/5/24.
//

import SwiftUI

struct Details: View {
    
    @State private var date = "04/26/25"
    @State private var type = "Income"
    @State private var category = "Food"
    @State private var amount = "15.83"

    var body: some View {
        NavigationStack{
            ZStack{
                Color(Color.primaryColor1)
                    .ignoresSafeArea()
                VStack {
                    Logo()
                        .frame(maxWidth: .infinity, alignment: .top)
                        .padding()
                    Button("Sort", systemImage: "line.3.horizontal.decrease.circle.fill"){}
                        .padding(.top, -50)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .foregroundColor(.black)
                    HStack {
                            Text("Date")
                            .padding()
                            Text("Type")
                            .padding()
                            Text("Category")
                            .padding()
                            Text("Amount")
                            .padding()
                    }.padding(.top, -50)
                        .padding()
                        ScrollView {
                            VStack{
                                HStack {
                                    TextField("", text: $date)
                                    TextField("", text: $type)
                                    TextField("", text: $category)
                                    TextField("", text: ($amount))
                                }.textFieldStyle(.roundedBorder)
                                    .padding(.top, -15)
                                    .padding()
                                HStack {
                                    TextField("", text: $date)
                                    TextField("", text: $type)
                                    TextField("", text: $category)
                                    TextField("", text: ($amount))
                                }.textFieldStyle(.roundedBorder)
                                    .padding(.top, -15)
                                    .padding()
                                HStack {
                                    TextField("", text: $date)
                                    TextField("", text: $type)
                                    TextField("", text: $category)
                                    TextField("", text: ($amount))
                                }.textFieldStyle(.roundedBorder)
                                    .padding(.top, -15)
                                    .padding()
                                HStack {
                                    TextField("", text: $date)
                                    TextField("", text: $type)
                                    TextField("", text: $category)
                                    TextField("", text: ($amount))
                                }.textFieldStyle(.roundedBorder)
                                    .padding(.top, -15)
                                    .padding()
                                HStack {
                                    TextField("", text: $date)
                                    TextField("", text: $type)
                                    TextField("", text: $category)
                                    TextField("", text: ($amount))
                                }.textFieldStyle(.roundedBorder)
                                    .padding(.top, -15)
                                    .padding()
                                HStack {
                                    TextField("", text: $date)
                                    TextField("", text: $type)
                                    TextField("", text: $category)
                                    TextField("", text: ($amount))
                                }.textFieldStyle(.roundedBorder)
                                    .padding(.top, -15)
                                    .padding()
                                HStack {
                                    TextField("", text: $date)
                                    TextField("", text: $type)
                                    TextField("", text: $category)
                                    TextField("", text: ($amount))
                                }.textFieldStyle(.roundedBorder)
                                    .padding(.top, -15)
                                    .padding()
                                HStack {
                                    TextField("", text: $date)
                                    TextField("", text: $type)
                                    TextField("", text: $category)
                                    TextField("", text: ($amount))
                                }.textFieldStyle(.roundedBorder)
                                    .padding(.top, -15)
                                    .padding()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    Details()
}
