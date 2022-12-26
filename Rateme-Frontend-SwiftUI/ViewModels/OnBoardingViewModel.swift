//
//  OnBoardingViewModel.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 26/12/2022.
//

import SwiftUI

class OnboardingViewModel: ObservableObject {
    
    let onboardingData = [
        OnboardingData(image: "OnBoardingImage1", title: "Share your daily activities with friends", description: "Connecting with Family and Friends provides a sense of belonging and security "),
        OnboardingData(image: "OnBoardingImage2", title: "Make new friends with ease", description: "Connecting with Family and Friends provides a sense of belonging and security "),
        OnboardingData(image: "OnBoardingImage3", title: "Let your friends rate your day", description: "Connecting with Family and Friends provides a sense of belonging and security "),
    ]
    
}

struct OnboardingData: Identifiable {
    
    let image: String
    let title: String
    let description: String
    
    var id: String { UUID().uuidString }
    
}
