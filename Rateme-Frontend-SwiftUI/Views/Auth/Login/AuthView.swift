//
//  AuthView.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 26/12/2022.
//

import SwiftUI

struct AuthView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var Auth : AuthViewModel
    @EnvironmentObject var viewRouter : ViewRouter
    var body: some View {
        NavigationStack {
            ZStack {
                Color("bgColor").ignoresSafeArea(.all)
                VStack(spacing: 60) {
                    CustomHeader(text: "Login to your account")
                        .padding(.leading, 45)
                    Text(Auth.message)
                        .foregroundColor(.red)
                        .fontWeight(.semibold)
                    VStack(alignment: .leading, spacing: 40) {
                        TextField("Email address", text: $Auth.login_email)
                            .textFieldStyle(CustomTextField(icon: "envelope", text: $Auth.login_email))
                        SecureField("Password", text: $Auth.login_password)
                            .textFieldStyle(CustomTextField(icon: "lock", text: $Auth.login_password))
                        NavigationLink(destination: ForgotPasswordStep1View()) {
                            Text("ForgotPassword?")
                                .fontWeight(.semibold)
                                .foregroundColor(Color("PrimaryColor"))
                        }
                        Button(action: {
                            if (Auth.login_email != "" && Auth.login_password != "") {
                                Auth.alert = true
                                Auth.isLoading = true
                                Auth.login()
                                
                            }
                        }, label: {})
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
            }.navigationBarBackButtonHidden(true)
                .blur(radius: Auth.alert ? 2 : 0)
                .customAlert(isPresented: $Auth.alert, hasIndicator: $Auth.isLoading, title: "Logging in", placeholder: "Placeholder")
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        Button (action: {
                            self.presentationMode.wrappedValue.dismiss()
                        })
                        {
                            HStack {
                                Image(systemName: "arrow.left")
                            }
                        }
                        .foregroundColor(Color("TextColor"))
                        .fontWeight(.bold)
                    }
                }
        }
    }
}
