//
//  Home.swift
//  FinanceFreedom
//
//  Created by Luismi on 5/14/24.
//

import SwiftUI

struct Home: View {
    var body: some View {
        NavigationStack {
                VStack  {
                    TabView {
                        
                        MyFinance()
                            .tabItem { Label("My Finnance", systemImage: "house.circle") }
                        CreateForm()
                            .tabItem { Label("Create", systemImage: "plus.circle") }
                        Details()
                            .tabItem { Label("Details", systemImage: "checklist.checked") }
                        AccountView(showCreateAccountView: .constant(false))
                            .tabItem { Label("Settings", systemImage: "gear") }
                    }.tabViewStyle(.automatic)
                        .background(.gray)
                        .onAppear(){
                            UITabBar.appearance().backgroundColor = .darkGray
                            UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance()}
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Rectangle().foregroundColor(Color.primaryColor1))
                    .ignoresSafeArea()
        }
    }
}

#Preview {
    Home()
}
