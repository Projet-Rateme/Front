//
//  Rateme_Frontend_SwiftUIApp.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 19/11/2022.
//

import SwiftUI

@main
struct Rateme_Frontend_SwiftUIApp: App {
    @StateObject var authService = AuthService()
    @AppStorage("isDarkMode") private var isDarkMode = true
    var body: some Scene {
        WindowGroup {
            if !authService.isAuthenticated {
                HomeView()
                    .preferredColorScheme(isDarkMode ? .dark : .light)
                    .environmentObject(authService)
            } else {
                AppView()
                    .preferredColorScheme(isDarkMode ? .dark : .light)
                    .environmentObject(authService)
            }
        }
    }
}
