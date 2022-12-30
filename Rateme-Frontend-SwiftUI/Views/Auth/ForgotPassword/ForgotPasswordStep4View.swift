//
//  ForgotPasswordStep4View.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 26/12/2022.
//

import SwiftUI

struct ForgotPasswordStep4View: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var Auth : AuthViewModel
    var body: some View {
        NavigationStack {
            ZStack {
                Color("bgColor").ignoresSafeArea(.all)
                VStack(spacing: 50) {
                    VStack(spacing: 50) {
                        Image("ResetPasswordImage")
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: UIScreen.main.bounds.height / 3.5)
                        Text("Create your new password")
                            .foregroundColor(Color("TextColor"))
                            .lineLimit(3)
                    }
                    .foregroundColor(.white)
                    .padding()
                    VStack(spacing: 50) {
                        Text(Auth.message)
                            .foregroundColor(.red)
                            .fontWeight(.semibold)
                        SecureField("Password", text: $Auth.reset_password)
                            .textFieldStyle(CustomTextField(icon: "lock", text: $Auth.reset_password))
                        TextField("Confirm Password", text: $Auth.reset_confirmPassword)
                            .textFieldStyle(CustomTextField(icon: "lock", text: $Auth.reset_confirmPassword))
                                   
                        Button(action: {
                            if (Auth.reset_password != "" && Auth.reset_confirmPassword != "") {
                                Auth.isLoading = true
                                Auth.alert = true
                                Auth.resetPassword()
                            }
                        }, label: {})
                        .buttonStyle(CustomButton(text: "Reset password", isPrimary: true, color: "PrimaryColor"))
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .blur(radius: Auth.alert ? 2 : 0)
            .customAlert(isPresented: $Auth.alert, hasIndicator: $Auth.isLoading, title: "Saving changes", placeholder: "Placeholder")
            .navigationDestination(isPresented: $Auth.navigateToForgotPasswordStep3) {
                ForgotPasswordStep3View()
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button (action: {
                        self.presentationMode.wrappedValue.dismiss()
                    })
                    {
                        HStack {
                            Image(systemName: "arrow.left")
                            Text("Forgot password")
                        }
                    }
                    .foregroundColor(Color("TextColor"))
                    .fontWeight(.bold)
                }
            }
        }
    }
}

struct ForgotPasswordStep4View_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordStep4View()
    }
}
