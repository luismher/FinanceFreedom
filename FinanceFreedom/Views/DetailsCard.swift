//
//  DetailsCard.swift
//  FinanceFreedom
//
//  Created by Luismi on 4/5/24.
//

import SwiftUI

struct DetailsCard: View {
    @State private var name = ""
    var body: some View {
        NavigationView{
            ZStack{
                Color(Color.primaryColor1)
                    .ignoresSafeArea()
                VStack {  Logo()
                        .frame(maxWidth: .infinity, alignment: .top)
                        .padding(.bottom, 60)
                    VStack (alignment: .leading, spacing: 30) {
                        TextField("", text: $name)
                            .textFieldStyle(.roundedBorder)
                            .padding()
                    }
                    .frame(width: 350, height: 400)
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
