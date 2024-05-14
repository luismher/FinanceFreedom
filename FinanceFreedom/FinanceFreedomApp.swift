//
//  FinanceFreedomApp.swift
//  FinanceFreedom
//
//  Created by Luismi on 4/4/24.
//

import SwiftUI

@main
struct FinanceFreedomApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            Home()
        }
    }
}
