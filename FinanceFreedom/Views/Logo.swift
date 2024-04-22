//
//  Logo.swift
//  FinanceFreedom
//
//  Created by Luismi on 4/5/24.
//

import SwiftUI

struct Logo: View {
    var body: some View {
        HStack {
            Image("FFLogo")
                .resizable()
                .frame(maxWidth: 80, maxHeight: 80)
                .cornerRadius(15.0)
                
        }
        .padding(.bottom)
        .onAppear()
    }
}

#Preview {
    Logo()
}
