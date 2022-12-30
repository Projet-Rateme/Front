//
//  ViewRouter.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 26/12/2022.
//

import Foundation
import SwiftUI

class ViewRouter: ObservableObject {
    
    init() {
        if !UserDefaults.standard.bool(forKey: "didLaunchBefore") {
            UserDefaults.standard.set(true, forKey: "didLaunchBefore")
        currentPage = .onBoardingView
        } else {
            currentPage = .loginView
        }
    }
    
    @Published var currentPage: Views = .loginView
    @Published var currentMainPage : AppViews = .feedView

    
}
