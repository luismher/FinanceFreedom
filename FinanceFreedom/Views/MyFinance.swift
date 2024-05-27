//
//  MyFinance.swift
//  FinanceFreedom
//
//  Created by Luismi on 4/5/24.
//

import SwiftUI

struct MyFinance: View {
    @State private var income: Float = 122482.20

    var body: some View {
        
        NavigationStack{
            ZStack{
                Color(Color.primaryColor1)
                    .ignoresSafeArea()
                    VStack{
                        Logo()
                            .frame(maxWidth: .infinity, alignment: .top)
                            .padding()
                        ScrollView {
                            VStack (alignment: .leading, spacing: -20) {
                                Text("Income")
                                    .financeStatus()
                                HStack  (spacing: -80){
                                    Image(systemName: "arrowtriangle.up.fill")
                                        .foregroundColor(Color.primaryColor1)
                                        .padding()
                                    Text("$" + String(format: "%.2f", income))
                                        .incomeNumberStatus()
                                    Text("Year")
                                        .incomeTextStatus()
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.top, 5)
                                HStack  (spacing: -80){
                                    Image(systemName: "arrowtriangle.up.fill")
                                        .foregroundColor(Color.primaryColor1)
                                        .padding()
                                    Text("$" + String(format: "%.2f", income))
                                        .incomeNumberStatus()
                                    Text("Month")
                                        .incomeTextStatus()
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.top, 5)
                            }
                            .frame(maxWidth: 400, maxHeight: 150)
                            .background(Rectangle().foregroundColor(Color.secondaryColor3))
                            .cornerRadius(15)
                            .shadow (radius: 15)
                            .padding()
                            VStack (alignment: .leading, spacing: -20) {
                                Text("Expenses")
                                    .financeStatus()
                                HStack  (spacing: -80){
                                    Image(systemName: "arrowtriangle.down.fill")
                                        .foregroundColor(Color.secondaryColor1)
                                        .padding()
                                    Text("$" + String(format: "%.2f", income))
                                        .expensesNumberStatus()
                                    Text("Year")
                                        .expensesTextStatus()
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.top, 5)
                                HStack  (spacing: -80){
                                    Image(systemName: "arrowtriangle.down.fill")
                                        .foregroundColor(Color.secondaryColor1)
                                        .padding()
                                    Text("$" + String(format: "%.2f", income))
                                        .expensesNumberStatus()
                                    Text("Month")
                                        .expensesTextStatus()
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.top, 5)
                            }
                            .frame(maxWidth: 400, maxHeight: 150)
                            .background(Rectangle().foregroundColor(Color.secondaryColor3))
                            .cornerRadius(15)
                            .shadow (radius: 15)
                            .padding()
                            
                            VStack (alignment: .leading, spacing: -20) {
                                Text("Savings")
                                    .financeStatus()
                                
                                HStack  (spacing: -80){
                                    Image(systemName: "arrowtriangle.up.fill")
                                        .foregroundColor(Color.primaryColor1)
                                        .padding()
                                    Text("$" + String(format: "%.2f", income))
                                        .incomeNumberStatus()
                                    Text("Year")
                                        .incomeTextStatus()
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.top, 5)
                                HStack  (spacing: -80){
                                    Image(systemName: "arrowtriangle.up.fill")
                                        .foregroundColor(Color.primaryColor1)
                                        .padding()
                                    Text("$" + String(format: "%.2f", income))
                                        .incomeNumberStatus()
                                    Text("Month")
                                        .incomeTextStatus()
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.top, 5)
                            }
                            .frame(maxWidth: 400, maxHeight: 150)
                            .background(Rectangle().foregroundColor(Color.secondaryColor3))
                            .cornerRadius(15)
                            .shadow (radius: 15)
                            .padding()
                            Spacer()
                    }
                }
            }
        }
    }
}

#Preview {
    MyFinance()
}
