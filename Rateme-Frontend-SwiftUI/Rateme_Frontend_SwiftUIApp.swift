//
//  Rateme_Frontend_SwiftUIApp.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 19/11/2022.
//

import SwiftUI

@main
struct Rateme_Frontend_SwiftUIApp: App {
    @AppStorage("isDarkMode") private var isDarkMode = true
    var body: some Scene {
        WindowGroup {
            AppView().preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
