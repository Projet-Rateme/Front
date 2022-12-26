//
//  OnBoardingPage.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 26/12/2022.
//

import SwiftUI

struct OnboardingPage: View {
    
    let image: String
    let title: String
    let description: String
    
    init(_ data: OnboardingData) {
        image = data.image
        title = data.title
        description = data.description
    }
    
    var body: some View {
        VStack(spacing: 50) {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(maxHeight: UIScreen.main.bounds.height / 2)
                
            VStack(alignment: .leading, spacing: 20) {
                Text(title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("TextColor"))
                
                Text(description)
                    .foregroundColor(Color("TextColor"))
                    .lineLimit(3)
            }
        }
        .foregroundColor(.white)
        .padding()
    }
}

struct OnboardingPage_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPage(OnboardingData(image: "OnBoardingImage2", title: "TESTING HERE", description: "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum "))
    }
}
