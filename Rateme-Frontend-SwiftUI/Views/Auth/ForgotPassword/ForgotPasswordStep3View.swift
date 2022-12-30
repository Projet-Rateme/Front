//
//  ForgotPasswordStep3View.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 26/12/2022.
//

import SwiftUI

import SwiftUI

struct ForgotPasswordStep3View: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var Auth : AuthViewModel
    var body: some View {
        NavigationStack {
            ZStack {
                Color("bgColor").ignoresSafeArea(.all)
                VStack (spacing: 50) {
                    Spacer()
                    Text("Code has been sent to \(Auth.reset_email)")
                    Text(Auth.message)
                        .foregroundColor(.red)
                        .fontWeight(.semibold)
                    VStack(spacing: 50) {
                        TextField("OTP Password", text: $Auth.reset_code)
                            .textFieldStyle(CustomTextField(icon: "lock", text: $Auth.reset_code))
                        Text("Resend code in 53 s")
                        Button(action: {
                            if Auth.reset_code != "" {
                                Auth.isLoading = true
                                Auth.verifyCode()
                            }
                        }, label: {})
                        .buttonStyle(CustomButton(text: "Verify", isPrimary: true, color: "PrimaryColor"))
                    }
                    Spacer()
                }
            }
        }.navigationBarBackButtonHidden(true)
            .navigationDestination(isPresented: $Auth.navigateToForgotPasswordStep4) {
                ForgotPasswordStep4View()
            }
        //                .blur(radius: Auth.alert ? 2 : 0)
        //                .customAlert(isPresented: $Auth.alert, hasIndicator: $Auth.isLoading, title: "Verifying account", placeholder: "Placeholder")
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

struct ForgotPasswordStep3View_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordStep3View()
    }
}
