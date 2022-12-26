//
//  App.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 26/12/2022.
//

import SwiftUI

struct Main: View {
    @EnvironmentObject var viewRouter: ViewRouter
        
    var body: some View {
        switch viewRouter.currentPage {
        case .onBoardingView:
            OnboardingView()
        case .loginView:
            switch viewRouter.currentLoginPage {
            case .loginPage1:
                LoginView()
            case .loginPage2:
                AuthView()
                    .transition(.move(edge: .trailing))
            }
        case .registerView:
            switch viewRouter.currentRegisterPage {
            case .registerPage1:
                RegisterView()
            case .registerPage2:
                RegisterStep2View()
                    .transition(.move(edge: .trailing))
            case .registerPage3:
                RegisterStep3View()
                    .transition(.move(edge: .trailing))
            case .registerPage4:
                RegisterStep4View()
                    .transition(.move(edge: .trailing))
            }
        case .forgotPasswordView:
            switch viewRouter.currentForgotPasswordPage {
            case .forgotPasswordPage1:
                ForgotPasswordStep1View()
                    .transition(.move(edge: .trailing))
            case .forgotPasswordPage2:
                ForgotPasswordStep2View()
                    .transition(.move(edge: .trailing))
            }
        }
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main().environmentObject(ViewRouter())
    }
}
