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
            LoginView()
        }
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main().environmentObject(ViewRouter())
    }
}
