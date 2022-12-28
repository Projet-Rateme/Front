//
//  AuthView.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 26/12/2022.
//

import SwiftUI

struct AuthView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
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
                        NavigationLink(destination: ForgotPasswordStep1View()) {
                            Text("ForgotPassword?")
                                .fontWeight(.semibold)
                                .foregroundColor(Color("PrimaryColor"))
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
            }.navigationBarBackButtonHidden(true)
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

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AuthView()
            AuthView().colorScheme(.dark)
        }
    }
}
