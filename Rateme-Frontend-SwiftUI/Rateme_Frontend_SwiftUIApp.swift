//
//  Rateme_Frontend_SwiftUIApp.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 19/11/2022.
//

import SwiftUI

@main
struct Rateme_Frontend_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            Main().environmentObject(ViewRouter())
        }
    }
}
