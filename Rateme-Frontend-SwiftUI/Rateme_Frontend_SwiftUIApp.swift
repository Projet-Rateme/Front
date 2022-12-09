//
//  Rateme_Frontend_SwiftUIApp.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 19/11/2022.
//

import SwiftUI

@main
struct Rateme_Frontend_SwiftUIApp: App {
    @StateObject var currentUser = AuthService()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(currentUser)
        }
    }
}
