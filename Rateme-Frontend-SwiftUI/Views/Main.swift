//
//  App.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 26/12/2022.
//

import SwiftUI

struct Main: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var Auth : AuthViewModel
        
    var body: some View {
        if !Auth.isAuthenticated {
            switch viewRouter.currentPage {
            case .onBoardingView:
                OnboardingView()
            case .loginView:
                LoginView()
            case .registerView:
                RegisterView()
            case .mainView:
                HomeView()
            }
        } else {
            withAnimation {
                AppView()
                    .transition(.slide)
            }
        }
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main().environmentObject(ViewRouter())
    }
}
