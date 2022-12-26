//
//  AuthView.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 26/12/2022.
//

import SwiftUI

struct AuthView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State var email = ""
    @State var password = ""
    var body: some View {
        NavigationStack {
            ZStack {
                Color("bgColor").ignoresSafeArea(.all)
                VStack(spacing: 60) {
                    CustomHeader(text: "Login to your account")
                        .padding(.leading, 45)
                    VStack(alignment: .leading, spacing: 40) {
                        TextField("Email address", text: $email)
                            .textFieldStyle(CustomTextField(icon: "envelope"))
                        SecureField("Password", text: $password)
                            .textFieldStyle(CustomTextField(icon: "lock"))
                        Text("ForgotPassword?")
                            .fontWeight(.semibold)
                            .foregroundColor(Color("PrimaryColor"))
                            .onTapGesture {
                                withAnimation {
                                    viewRouter.currentPage = .forgotPasswordView
                                }
                            }
                        Button(action: {}, label: {})
                            .buttonStyle(CustomButton(text: "Sign in", isPrimary: true, color: "PrimaryColor"))
                    }
                    
                    Divider()
                    VStack(spacing: 40) {
                        HStack(spacing: 40) {
                            Button(action: {}, label: {})
                                .buttonStyle(CustomButton(text: "", isPrimary: false, icon: Image("Google"), color: "SecondaryColor"))
                                .frame(maxWidth: UIScreen.main.bounds.width / 5)
                            Button(action: {}, label: {})
                                .buttonStyle(CustomButton(text: "", isPrimary: false, icon: Image("Facebook"), color: "SecondaryColor"))
                                .frame(maxWidth: UIScreen.main.bounds.width / 5)
                            Button(action: {}, label: {})
                                .buttonStyle(CustomButton(text: "", isPrimary: false, icon: Image("Google"), color: "SecondaryColor"))
                                .frame(maxWidth: UIScreen.main.bounds.width / 5)
                        }
                        HStack {
                            Text("Don't have an account?")
                            Text("Sign up")
                                .foregroundColor(Color("PrimaryColor"))
                        }
                    }
                }
            }.toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button {
                        withAnimation {
                            viewRouter.currentLoginPage = .loginPage1
                        }
                    } label: {
                        Image(systemName: "arrow.left")
                    }
                    .foregroundColor(Color("TextColor"))
                    .fontWeight(.bold)
                }
            }
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AuthView()
            AuthView().colorScheme(.dark)
        }
    }
}
