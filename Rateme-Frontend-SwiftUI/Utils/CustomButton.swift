//
//  SecondaryButton.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 25/12/2022.
//

import SwiftUI

struct CustomButton: ButtonStyle {
    let text: String
    let isPrimary: Bool
    @State var icon: Image?
    let color: String
    //let socialButton: Bool

    func makeBody(configuration: Self.Configuration) -> some View {
        withAnimation(.easeIn) {
            HStack {
                if icon != nil {
                    icon?.resizable()
                        .scaledToFit()
                        .frame(maxWidth: 40 , maxHeight: 40)
                }
                Text(text)
                    .fontWeight(.bold)
                    .foregroundColor(isPrimary ? Color(.white) : Color("TextColor"))
            }.frame(maxWidth: UIScreen.main.bounds.width / 1.2,
                    minHeight: UIScreen.main.bounds.width / 7, alignment: .center)
            .background(Color(color))
            .foregroundColor(Color.white)
            .cornerRadius(10)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
        }
            
        
        
    }
}
