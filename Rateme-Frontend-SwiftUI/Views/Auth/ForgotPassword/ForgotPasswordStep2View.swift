//
//  ForgotPasswordStep1View.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 26/12/2022.
//

import SwiftUI

struct ForgotPasswordStep2View: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var Auth : AuthViewModel
    var body: some View {
        NavigationStack {
            ZStack {
                Color("bgColor").ignoresSafeArea(.all)
                VStack(spacing: 50) {
                    VStack(spacing: 50) {
                        Image("ForgotPasswordImage")
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: UIScreen.main.bounds.height / 3.5)
                        Text("Insert your email to receive an OTP")
                            .foregroundColor(Color("TextColor"))
                            .lineLimit(3)
                    }
                    .foregroundColor(.white)
                    .padding()
                    VStack(spacing: 50) {
                        Text(Auth.message)
                            .foregroundColor(.red)
                            .fontWeight(.semibold)
                        TextField("Email Address", text: $Auth.reset_email)
                            .textFieldStyle(CustomTextField(icon: "envelope", text: $Auth.reset_email))
                                   
                        Button(action: {
                            if (Auth.reset_email != "") {
                                Auth.isLoading = true
                                Auth.forgotPassword()
                            }
                        }, label: {})
                        .buttonStyle(CustomButton(text: "Continue", isPrimary: true, color: "PrimaryColor"))
                        .disabled(Auth.isLoading)
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
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

struct ForgotPasswordStep1View_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForgotPasswordStep1View()
            ForgotPasswordStep1View().colorScheme(.dark)
        }
    }
}
