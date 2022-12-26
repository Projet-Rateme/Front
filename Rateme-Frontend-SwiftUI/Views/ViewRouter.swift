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
//        if !UserDefaults.standard.bool(forKey: "didLaunchBefore") {
//            UserDefaults.standard.set(true, forKey: "didLaunchBefore")
        currentPage = .onBoardingView
//        } else {
//            currentPage = "homeView"
//        }
    }
    
    @Published var currentPage: Views = .onBoardingView
    @Published var currentLoginPage: LoginViews = .loginPage1
    @Published var currentRegisterPage: RegisterViews = .registerPage1
    @Published var currentForgotPasswordPage: ForgotPasswordViews = .forgotPasswordPage1
    
}
