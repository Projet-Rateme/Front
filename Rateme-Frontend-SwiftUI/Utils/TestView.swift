//
//  TestView.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 25/12/2022.
//

import SwiftUI

struct TestView: View {
    
    @State var text = ""

    var body: some View {
        ZStack {
            Color("bgColor").ignoresSafeArea(.all)
            VStack {
                Button(action: {}, label: {})
                    .buttonStyle(CustomButton(text: "Get Started", isPrimary: true, color: "PrimaryColor", hasIcon: false))
                Button(action: {}, label: {})
                    .buttonStyle(CustomButton(text: "Connect with google", isPrimary: false, icon: Image("google"), color: "SecondaryColor", hasIcon: true))
                CustomHeader(text: "Login to your account")
                    .padding(.leading, 45)
                TextField("Name", text: $text)
                    .textFieldStyle(CustomTextField(icon: "person"))
                SecureField("Password", text: $text)
                    .textFieldStyle(CustomTextField(icon: "lock"))
            }
        }
        
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TestView()
            TestView().colorScheme(.dark)
        }
    }
}
