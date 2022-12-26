//
//  OnBoardingView.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 26/12/2022.
//

import SwiftUI

struct OnboardingView: View {
    
    let model = OnboardingViewModel()
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State var selection = 0
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color("bgColor").ignoresSafeArea(.all)
                VStack {
                    TabView (selection: $selection) {
                        OnboardingPage(model.onboardingData[0])
                            .tag(0)
                        OnboardingPage(model.onboardingData[1])
                            .tag(1)
                        OnboardingPage(model.onboardingData[2])
                            .tag(2)
                    }
                    .tabViewStyle(.page)
                    .indexViewStyle(.page(backgroundDisplayMode: .always))
                    if selection == 2 {
                        withAnimation(.easeOut) {
                            Button(action: {
                                self.viewRouter.currentPage = .loginView
                            }, label: {})
                                .buttonStyle(CustomButton(text: "Get Started", isPrimary: true, color: "PrimaryColor"))
                        }
                    }
                }
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OnboardingView()
            OnboardingView().colorScheme(.dark)
        }
    }
}
