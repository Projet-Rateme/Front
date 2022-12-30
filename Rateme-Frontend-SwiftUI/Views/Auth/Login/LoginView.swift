//
//  LoginView.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 26/12/2022.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var viewRouter : ViewRouter
    @State private var readyToNavigate = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("bgColor").ignoresSafeArea(.all)
                
                VStack(spacing: 40) {
                    Image("OnBoardingImage2")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: UIScreen.main.bounds.width / 1.5)
                    
                    VStack(spacing: 40) {
                        Button(action: {}, label: {})
                            .buttonStyle(CustomButton(text: "Connect with google", isPrimary: false, icon: Image("Google"), color: "TextFieldColor"))
                        Button(action: {}, label: {})
                            .buttonStyle(CustomButton(text: "Connect with facebook", isPrimary: false, icon: Image("Facebook"), color: "TextFieldColor"))
                        Button(action: {}, label: {})
                            .buttonStyle(CustomButton(text: "Connect with apple", isPrimary: false, icon: Image("Google"), color: "TextFieldColor"))
                    }
                    
                    Divider()
                    VStack(spacing: 40) {
                        Button(action: {
                            self.readyToNavigate = true
                            
                        }, label: {})
                        .buttonStyle(CustomButton(text: "Continue with email", isPrimary: true, color: "PrimaryColor"))
                        HStack {
                            Text("Don't have an account?")
                            NavigationLink(destination: RegisterView()) {
                                Text("Sign up")
                                    .foregroundColor(Color("PrimaryColor"))
                                    .onTapGesture {
                                        viewRouter.currentPage = .registerView
                                    }
                            }
                        }
                    }
                }
            }.navigationDestination(isPresented: $readyToNavigate) {
                AuthView()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView()
                .environmentObject(ViewRouter())
            LoginView()
                .environmentObject(ViewRouter())
                .colorScheme(.dark)
        }
    }
}
